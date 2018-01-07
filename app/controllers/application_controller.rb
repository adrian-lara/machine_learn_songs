class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def refresh_access_token
    conn = Faraday.new(url: "https://accounts.spotify.com")
    response = conn.post do |req|
      req.url "/api/token"
      req.body = "client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&grant_type=refresh_token&refresh_token=#{current_user.refresh_token}"
    end
    raw_user_tokens = JSON.parse(response.body, symbolize_names: true)

    current_user.update(access_token: raw_user_tokens[:access_token])
  end

  def check_user
    render_404 unless current_user
  end

  private

    def render_404
      raise ActionController::RoutingError.new("Page Does Not Exist.")
    end
end

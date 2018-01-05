class SessionController < ApplicationController

  def create
    if params[:code]
      conn = Faraday.new(url: "https://accounts.spotify.com")
      response = conn.post do |req|
        req.url "/api/token"
        req.body = "client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&grant_type=authorization_code&code=#{params[:code]}&redirect_uri=#{ENV['base_url']}/spotify/callback"
      end
      raw_user_tokens = JSON.parse(response.body, symbolize_names: true)

      user_conn = Faraday.new(url: "https://api.spotify.com")
      user_data_response = user_conn.get do |req|
        req.url "/v1/me"
        req.headers['Authorization'] = "Bearer #{raw_user_tokens[:access_token]}"
      end
      raw_user_data = JSON.parse(user_data_response.body, symbolize_names: true)

      user = User.find_or_create_by(uid: raw_user_data[:id])
      user.update(
        access_token: raw_user_tokens[:access_token],
        refresh_token: raw_user_tokens[:refresh_token],
        token_type: raw_user_tokens[:token_type]
      )

      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

end

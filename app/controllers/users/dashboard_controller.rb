class Users::DashboardController < ApplicationController
  before_action :check_user

  def index
    conn = Faraday.new("https://api.spotify.com")
    response = conn.get do |req|
      req.url "/v1/me/player/currently-playing"
      req.headers['Authorization'] = "Bearer #{current_user.access_token}"
    end

    unless response.body.empty?
      raw_song_data = JSON.parse(response.body, symbolize_names: true)
      @song = Song.new(raw_song_data, current_user)
    end
  end

end

class Users::DashboardController < ApplicationController

  def index
    conn = Faraday.new("https://api.spotify.com")
    response = conn.get do |req|
      req.url "/v1/me/player/currently-playing"
      req.headers['Authorization'] = "Bearer #{current_user.access_token}"
    end
    raw_song_data = JSON.parse(response.body, symbolize_names: true)

    @song = Song.new(raw_song_data)
  end

end

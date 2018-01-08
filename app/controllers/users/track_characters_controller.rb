class Users::TrackCharactersController < ApplicationController

  def create
    conn = Faraday.new(url: "https://api.spotify.com/")
    response = conn.get do |req|
      req.url "v1/audio-features/#{params[:track_id]}"
      req.headers['Authorization'] = "#{current_user.token_type} #{current_user.access_token}"
    end
    track_character_data = JSON.parse(response.body, symbolize_names: true)
    SongAssessmentService.assess(track_character_data, current_user, params[:assessment])

    redirect_to dashboard_path
  end

end

class Users::PredictController < ApplicationController

  def index
    api_service = SpotifyService.new(current_user)
    @song = api_service.currently_playing

    audio_features = api_service.get_audio_features(@song.track_id)
    track_character = SongAssessmentService.find_or_create_track_character(audio_features)
    prediction = Prediction.new(current_user)
    @result = prediction.result(track_character)
  end

end

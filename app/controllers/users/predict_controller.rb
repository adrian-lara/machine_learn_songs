class Users::PredictController < ApplicationController

  def index
    creation_service = CreationService.new(current_user)

    @song = creation_service.currently_playing_song
    @result = creation_service.prediction(@song)
  end

end

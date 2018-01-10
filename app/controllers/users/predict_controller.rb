class Users::PredictController < ApplicationController

  def index
    service = SpotifyService.new(current_user)
    @song = service.currently_playing
  end

end

class Users::TrackCharactersController < ApplicationController

  def create
    creation_service = CreationService.new(current_user)
    creation_service.song_assessment(current_user, params[:track_id], params[:assessment])

    redirect_to dashboard_path
  end

end

class Users::TrackCharactersController < ApplicationController

  def create
    SongAssessmentService.assess(current_user, params[:track_id], params[:assessment])

    redirect_to dashboard_path
  end

end

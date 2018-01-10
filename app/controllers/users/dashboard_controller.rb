class Users::DashboardController < ApplicationController
  before_action :check_user

  def index
    creation_service = CreationService.new(current_user)
    @song = creation_service.currently_playing_song
  end

end

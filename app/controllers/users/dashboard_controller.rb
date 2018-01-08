class Users::DashboardController < ApplicationController
  before_action :check_user

  def index
    service = SpotifyService.new(current_user)
    @song = service.currently_playing
  end

end

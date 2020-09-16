class InvitationsController < ApplicationController
  before_action :set_home
  skip_before_action :authenticate_user!
  def new
    if user_signed_in?
      current_user.update(home:@home)
      redirect_to dashboard_path and return
    else
      redirect_to new_user_registration_path(invite_token:params[:home_invite_token]) and return
    end
  end

  def update
    @home.regenerate_invite_token
  end

private

  def set_home
  @home = Home.find_by(invite_token:params[:home_invite_token])
  end
end

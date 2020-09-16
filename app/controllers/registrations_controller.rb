class RegistrationsController < Devise::RegistrationsController
  def  new
    set_home
  super
  end
  def create
    set_home
    super
    if resource.save && params[:user].has_key?(:invite_token)
      resource.home = @home
      resource.save
      redirect_to dashboard_path
    end

  end
private
  def set_home
  @home = Home.find_by(invite_token:(params[:invite_token]||params[:user][:invite_token]))
  end
end

class RegistrationsController < Devise::RegistrationsController
  def  new
    set_home if params[:invite_token]
  super
  end
  def create
    super
    if resource.save && params[:user].has_key?(:invite_token)
      set_home
      resource.home = @home
      resource.save
    # else render :new
    end

  end
private
  def set_home
  @home = Home.find_by(invite_token:(params[:invite_token]||params[:user][:invite_token]))
  end
end

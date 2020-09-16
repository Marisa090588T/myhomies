class HomiesController < ApplicationController
  before_action :set_home
  before_action :set_homie

  def index
    @homies.all
  end

  def new
    @homie = User.new(homie_params)
    @homie.home = @home

    @homies < @homie
  end

  def create

    @homie = User.new(homie_params)

    if @homie.save
      @homie.home = @home
      @homies < @homie
      redirect_to dashboard_path, notice: "Congrats, your home has a new homie!"
    else
      render :new
    end
  end

  private

  def homie_params
    params.require(:home).permit(:first_name, :last_name, :username, :email, :password)
  end

  def set_home
    @home = Home.find {|home| current_user.home == home }
  end

  def set_homies
    @homies = User.all.select(params[:home] == @home)
  end
end

class HomesController < ApplicationController
  before_action :set_users, :set_homie, only: [:new, :create]

  # def index
  #   @homes = Home.all
  # end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)

    @users.each do |user|
      user.first_name
    end

    if @home.save
      redirect_to dashboard_path, notice: "Congrats, you've created a home!"
    else
      render :new
    end
    raise
  end

  def show
    @home = Home.find(params[:id])
  end

  private

  def set_homie
    @homie == current_user
  end

  def set_users
    @users = User.all
  end

  def home_params
    params.require(:home).permit(:name, :address)
  end
end

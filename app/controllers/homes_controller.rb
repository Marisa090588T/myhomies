class HomesController < ApplicationController
  before_action :set_homie
  before_action :set_users

  # def index
  #   @homes = Home.all
  # end

  def new
    @home = Home.new
    @users_collection = []
    @users.each do |user|

    @users_collection << user.first_name
    end
  end

  def create
    # @home = Home.find(params[:home_id])
    @home = Home.new(home_params)
    @my_homes = []

    if @home.save
      @homie.home = @home
      @homie.update(home: @home)
      @my_homes << @home
      redirect_to dashboard_path, notice: "Congrats, you've created a home!"
    else
      render :new
    end

  end

  def show
    @home = Home.find(params[:id])
  end

  private

  def set_homie
    @homie = current_user
  end

  def set_users
    @users = User.all
  end

  def home_params
    params.require(:home).permit(:name, :address)
  end
end

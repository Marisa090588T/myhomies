class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @home = Home.find(params[:home_id])
    @chore = Chore.new
    @chore.home = @home
  end

  def create
    @chore = Chore.new(chore_params)
    @chore.home = @home
    @chore.users = @users
    
    if @chore.save
      @chore.users.each do |user|
        redirect_to home_chores_path, notice: 'Chore was successfully listed!'      
      end
    else
      render :new
    end
  end

end

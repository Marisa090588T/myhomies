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
    @home = Home.find(params[:home_id])
    @chore = Chore.new(chore_params)
    @chore.home = @home
    @chore.completed = false
    @chore.assignee = @home.users.sample
    
    if @chore.save
        redirect_to home_chores_path, notice: 'Chore was successfully listed!'      
    else
      render :new
    end
  end

  private

  def chore_params
    params.require(:chore).permit(:name, :description)
  end

end

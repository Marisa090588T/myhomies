class ChoresController < ApplicationController
  def index
    @chores = Chore.all
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
    
  def show
    @home = Home.find(params[:home_id])
    @chore = Chore.find(params[:id])
    @chore.home = @home
  end

  private

  def chore_params
    params.require(:chore).permit(:name, :description, :assignee)
  end

end

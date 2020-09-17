class ChoresController < ApplicationController
  def index
    @chores = Chore.all
    @home = Home.find(params[:home_id])
    @chore = Chore.find_by(assignee: current_user, home: @home)
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

  def complete
    @home = Home.find(params[:home_id])
    @chore = Chore.find(params[:id])
    @home.chore = @home
    @chore.completed = true
    @chore.save
    redirect_to dashboard_path # TODO: should go back show page?
  end
end

# change status as mark (conplete or not)
# need a update?
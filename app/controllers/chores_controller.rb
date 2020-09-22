class ChoresController < ApplicationController
  def index
    @home = Home.find {|home| current_user.home == home }
    @chores = @home.chores.all.order(:created_at)
  end

  def new
    @home = Home.find(params[:home_id])
    @chore = Chore.new
    @chore.home = @home
    @homies = []
    @home.users.each do |homie|
      @homies << homie.first_name
    end
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

  def done
    @home = Home.find {|home| current_user.home == home }
    @chore = Chore.find(params[:id])
    @chore.home = @home
    @chore.completed = !@chore.completed
    @chore.save!
    redirect_to home_chores_path(@chore)
  end

  private

  def chore_params
    params.require(:chore).permit(:name)
  end
end




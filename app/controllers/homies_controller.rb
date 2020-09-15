class HomiesController < ApplicationController
  def show
    @home = Home.find(params[:id])
    @homies = @home.users
  end
end

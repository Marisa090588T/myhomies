class HomiesController < ApplicationController
  def index
    @home = current_user(params[:home])
    @homies = User.all.select(@home)
  end
end

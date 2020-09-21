class User::ChoresController < ApplicationController
  def index
    @chores = current_user.chores
    @home = current_user.home
    @user = current_user
  end
end

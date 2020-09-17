class User::ChoresController < ApplicationController
  def index
    @chores = current_user.chores
  end
end

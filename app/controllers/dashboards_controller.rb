class DashboardsController < ApplicationController
  def show
    # @user =
    # @homies = Home.all.select {|home| home == current_user.home }

    @my_homes = Home.all.select {|home| current_user.home == home }
  end
end

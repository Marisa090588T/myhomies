class DashboardsController < ApplicationController
  def show
    if current_user.home
      @home = Home.find {|home| current_user.home == home }
      @homies = @home.users
    end
  end
end

class DashboardsController < ApplicationController
  def show
    @homes = Home.where(user: current_user)
  end
end

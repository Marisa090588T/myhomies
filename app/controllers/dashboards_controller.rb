class DashboardsController < ApplicationController
 def show
   @home = Home.find {|home| current_user.home == home }
   @homies = @home.users
 end
end

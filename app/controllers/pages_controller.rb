class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]

  def home
  redirect_to dashboard_path
  end

  def kitchensink

  end
end

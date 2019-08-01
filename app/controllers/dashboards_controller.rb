class DashboardsController < ApplicationController

  def index
  	@user_details = current_user
  end

end
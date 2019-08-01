class DashboardsController < ApplicationController

  def index
  	@user_details = current_user
  	@address_details = current_user.address
  end

end
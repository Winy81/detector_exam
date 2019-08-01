class PagesController < ApplicationController

  def home
  	if current_user
  	  redirect_to dashboards_path
  	end
  end

end
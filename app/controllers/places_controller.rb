class PlacesController < ApplicationController

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params.require(:place).permit(:postcode,:user_id))
    if @place.save
      flash[:notce] = "Postcode has been added"
      redirect_to dashboards_path
    else
      flash[:alarm] = "Postcode has not been added"
      redirect_to new_place_path
    end
  end

end
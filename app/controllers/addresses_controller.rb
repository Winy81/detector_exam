class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params.require(:address).permit(:postcode,:user_id))
    if @address.save
      flash[:notce] = "Address has been added"
      redirect_to dashboards_path
    else
      flash[:alarm] = "Address has not been added"
      redirect_to new_addres_path
    end
  end

end
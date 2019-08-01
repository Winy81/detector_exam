def AddressesController < ApplicationController

  def create
    @address = current_user.address.new(address_params)
  end

  def create
  	if current_user
      @address = current_user.address.new(address_params)
      if @address.save
      	flash[:notice] = "Address has been added"
      	redirect_to dashboards_path
      else
      	flash[:notice] = "Address has not been created"
      	render new
      end
    end
  end

  private

  def comment_params
    params.require(:address).permit(:postcode)
  end

end
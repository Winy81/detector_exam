class AddressesController < ApplicationController

  def new
    @address = current_user.address.new
  end

  def create
  	if current_user
      @address = current_user.address.new
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

  def address_params
    params.require(:address).permit(:postcode, :user_id)
  end

end
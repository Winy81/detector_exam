def AddressesController < ApplicationController

  def create
    @address = current_user.address.build(address_params)
  end

  private

  def comment_params
    params.require(:address).permit(:postcode)
  end

end
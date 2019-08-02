class CardsController < ApplicationController

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(params.require(:card).permit(:last_four_digits,:expiry_date,:user_id))
    if @card.save
      flash[:notce] = "Card has been added"
      redirect_to dashboards_path
    else
      flash[:alarm] = "Card has not been added"
      redirect_to new_card_path
    end
  end

end
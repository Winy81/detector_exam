require 'rails_helper'

RSpec.feature "Dashboard index" do

  before do 

    @john = User.create!(first_name:"John", last_name:"Doe", email:"john@doe.com", password: "password")    
    @card = Card.create(last_four_digits: 1234, expiry_date: "2019-08-02 00:28:13", user_id: @john.id)
    @place = Place.create(postcode:"LS10 ...", user_id: @john.id)

  end


  scenario "All of information Added" do

    login_as(@john) 

    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@john.id)
    expect(page).to have_content(@card.last_four_digits)
    expect(page).to have_content("#{@card.expiry_date.year} / #{@card.expiry_date.month}") 
    expect(page).to have_content(@place.postcode)

  end

end
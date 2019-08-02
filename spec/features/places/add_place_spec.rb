require 'rails_helper'

RSpec.feature "Add card for user" do

  before do 
    @john = User.create!(first_name:"John", last_name:"Doe", email:"john@doe.com", password: "password")
  end

  scenario "With valid place details" do 

    login_as(@john)

    visit "/"

    expect(page).to have_content("Your address is not registered yet")

    click_link('Add Postcode')

    fill_in "place_postcode", with: "LS10 4QW"

    click_button "Save Place"

    expect(page).to have_content("Your postcode is: LS10 4QW")

  end

  scenario "With invalid place details" do 

    login_as(@john)

    visit "/"

    expect(page).to have_content("Your address is not registered yet")

    click_link('Add Postcode')

    fill_in "place_postcode", with: ""

    click_button "Save Place"

    expect(page).to have_content("Postcode has not been added")

  end

end
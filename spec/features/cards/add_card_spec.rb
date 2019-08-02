require 'rails_helper'

RSpec.feature "Add card for user" do

  before do 
    @john = User.create!(first_name:"John", last_name:"Doe", email:"john@doe.com", password: "password")
  end

  scenario "With valid details" do 

    login_as(@john)

    visit "/"

    expect(page).to have_content("Your card is not registered yet")

    click_link('Add Card')

    fill_in "card_last_four_digits", with: 1234
    fill_in "card_expiry_date", with: "2019-08-02 00:28:13"

    click_button "Save Card"

    expect(page).not_to have_content("Your card is not registered yet")
    expect(page).not_to have_link('Add Card')
    expect(page).to have_content("Your card's last four digits: 1234")



  end

end
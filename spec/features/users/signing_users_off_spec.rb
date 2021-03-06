require 'rails_helper'

RSpec.feature "User sign_out" do

  before do
  	@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  end

  scenario "User sign_off successfully" do 

  	visit "/"

  	click_link "Sign In"
  	fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    expect(page).to have_link("Sign Out")

    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_link("Sign In")
    expect(page).to have_link("Sign Up")

  end

end
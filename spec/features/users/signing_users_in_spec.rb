require 'rails_helper'

RSpec.feature "User sign_in" do

  before do
  	@john = User.create!(first_name: "John", last_name: "Doe",email: "john@example.com", password: "password")
  end

  scenario "Sign in successfully" do 

  	visit "/"

  	click_link "Sign In"
  	fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Welcome: #{@john.full_name}")
    expect(page).to have_link("Sign Out")
    expect(page).to_not have_link("Sign up")
    expect(page).to_not have_link("Sign in")

  end
end
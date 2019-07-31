require 'rails_helper'

RSpec.feature "Root page" do 

  scenario "Root page should have" do 

  	visit "/"

  	expect(page).to have_content("Detector App")
  	expect(page).to have_link("Sign_In")
  	expect(page).to have_link("Sign_Up")

  end

end
require "spec_helper"
require "rails_helper"

feature "static home page" do
  
  scenario "anonymous user visits the home page" do
    visit root_url
    expect(page).to have_content("Welcome to Chief Awesome!")
  end
end

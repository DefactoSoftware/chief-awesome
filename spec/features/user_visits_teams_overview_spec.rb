require "spec_helper"

feature "user visits teams overview" do
  before :each do
    sign_in_user
  end

  scenario "user visits teams overview" do
    click_link "Teams"
    expect(page).to have_content("All Teams")
  end
end
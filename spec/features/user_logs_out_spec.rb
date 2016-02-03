require "spec_helper"

feature "log out" do
  scenario "user logs out" do
    sign_in_user
    visit root_path

    click_link "Log out"

    expect(page).to_not have_content("Welcome: foo")
  end
end

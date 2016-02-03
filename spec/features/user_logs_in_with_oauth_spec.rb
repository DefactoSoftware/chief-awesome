require "spec_helper"

feature "log in" do
  scenario "user logs in through oauth with yammer" do
    visit register_path

    set_omniauth(opts = {})

    click_link "Register with Yammer"

    expect(page).to have_content("Welcome: foo")
  end
end

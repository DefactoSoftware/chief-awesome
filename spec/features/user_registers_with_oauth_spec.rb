require "spec_helper"

feature "register" do

  scenario "user goes to register page" do
    visit root_url
    expect(page).to have_content("Register")

    click_link "Register"
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Create your account")
  end

  scenario "user creates account through oauth with yammer" do
    visit register_path

    previous_amount_of_users = User.count

    set_omniauth(opts = {})

    click_link "Register with Yammer"

    expect(User.count).to be(previous_amount_of_users + 1)
  end
end

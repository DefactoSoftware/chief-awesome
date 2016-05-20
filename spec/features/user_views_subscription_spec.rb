require "spec_helper"

feature "subscription overview" do
  scenario "anonymous user cannot visit subscription overview" do
    visit subscription_url

    expect(page).to have_content("Not authorized")
    expect(page).to have_content("Register")
  end

  scenario "signed in non-owner cannot see subscription overview" do
    team_owner = create(:user, email: "hansolo@myteam.com")
    team = create(:team, id: "1", domain: "myteam.com", owner: team_owner)
    sign_in_different_user
    visit root_url

    click_link "Subscription"

    expect(page).to have_content("Not authorized")
  end

  scenario "signed in owner visits subscription overview" do
    sign_in_user
    visit root_url
    click_link "Subscription"

    expect(page).to have_content("Your Subscription")
  end

  scenario "subscription user count is updated for new users" do
    user = create(:user)
    sign_in_user
    visit root_url
    click_link "Subscription"

    expect(page).to have_content("Number of users: 2")
  end
end

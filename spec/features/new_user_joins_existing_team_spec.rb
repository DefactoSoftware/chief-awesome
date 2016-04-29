require "spec_helper"

feature "new user creates or joins team" do
  scenario "user joins existing team" do
    team_owner = create(:user, email: "hansolo@myteam.com")
    team = create(:team, id: "1", domain: "myteam.com", owner: team_owner)

    sign_in_different_user
    expect(Team.last.domain).to eq("myteam.com")
    expect(Team.last.owner).to_not eq(User.last)
    expect(Membership.last.user).to eq(User.last)
  end

  scenario "user creates new team" do
    sign_in_user

    expect(Team.last.owner).to eq(User.last)
    expect(Team.last.domain).to eq("example.com")
  end
end

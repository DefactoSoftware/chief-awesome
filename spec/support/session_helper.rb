def sign_in_user
  visit register_path
  set_omniauth(opts = {})
  click_link "Register with Yammer"
end

def sign_in_different_user
  visit register_path
  set_omniauth(opts = {
    :provider => :yammer,
    :uuid     => "6789",
    :yammer => {
      :email => "boba@myteam.com",
      :name => "Boba Fett"
    }
  })
  click_link "Register with Yammer"
end

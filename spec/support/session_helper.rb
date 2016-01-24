def sign_in_user
  visit register_path
  set_omniauth(opts = {})
  click_link "Register with Yammer"
end
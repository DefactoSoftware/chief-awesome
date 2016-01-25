def set_omniauth(opts = {})
  default = {
    :provider => :yammer,
    :uuid     => "1234",
    :yammer => {
      :email => "foobar@example.com",
      :name => "foo"
    }
  }

  credentials = default.merge(opts)
  provider = credentials[:provider] 
  user_hash = credentials[provider]

  OmniAuth.config.mock_auth[provider] = 
  {
    "uid" => credentials[:uuid],
    "provider" => provider,
    "info" => {
      "email" => user_hash[:email],
      "name" => user_hash[:name],
    }
  }

end

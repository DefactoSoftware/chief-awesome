source "https://rubygems.org"

ruby "2.3.0"

gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "neat", "~> 1.7.0"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0.beta2"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "turbolinks"
gem "title"
gem "uglifier"
gem "omniauth"
gem "omniauth-yammer"
gem "stripe"

group :development do
  gem "quiet_assets"
  gem "refills"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
  gem "vcr"
end

group :staging, :production do
  gem "rack-timeout"
end

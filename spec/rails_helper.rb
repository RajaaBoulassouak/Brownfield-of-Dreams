require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<YOUTUBE_API_KEY>") { ENV['YOUTUBE_API_KEY'] }
  config.filter_sensitive_data("<GITHUB_API_KEY_1>") { ENV['USER_GITHUB_TOKEN_1'] }
  config.filter_sensitive_data("<GITHUB_API_KEY_2>") { ENV['USER_GITHUB_TOKEN_2'] }
end

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome

Capybara.configure do |config|
  config.default_max_wait_time = 5
end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

def stub_omniauth
  omniauth_hash = {
                    'provider'   => 'github',
                    'uid'        => '8312280',
                    'login'      => 'peachesamaloney',
                    'info'       =>
                                    {
                                     'name'     => 'Peaches Maloney',
                                     'email'    => 'peaches@gmail.com',
                                     'nickname' => 'peaches'
                                    },
                    'credentials'=>
                                    {
                                     'token' => 'abc123'
                                    },
                    'extra'      =>
                                    {
                                     'raw_info' =>
                                                   {
                                                    'html_url'   => 'https://github.com/Peaches',
                                                    'public_repos' => '46'
                                                   }
                                    }
                }
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:github, omniauth_hash)
end
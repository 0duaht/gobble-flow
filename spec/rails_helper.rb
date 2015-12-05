ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if
  Rails.env.production?
require "spec_helper"
require "test_helper"
require "rspec/rails"
require "capybara/rspec"
require "capybara/rails"

Capybara.default_max_wait_time = 8

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include Capybara::DSL
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Gobble::Shortener::Test
end

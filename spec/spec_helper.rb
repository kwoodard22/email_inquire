# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter("spec/")
end

if ENV["CI"] == "true"
  require "codecov"
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require "bundler/setup"
require "email_inquire"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    EmailInquire.custom_invalid_domains = nil
    EmailInquire.custom_valid_domains = nil
  end
end

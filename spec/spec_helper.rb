require "bundler/setup"
require 'dotenv'
require "halo"
require "vcr"
require "webmock/rspec"

Dotenv.load

VCR.configure do |config|
  config.filter_sensitive_data('api-key') { ENV['API_KEY'] }
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

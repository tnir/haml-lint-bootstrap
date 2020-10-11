require "bundler/setup"
require "haml_lint"
require "haml_lint/spec"
require "haml_lint/linter/bootstrap_utilities"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

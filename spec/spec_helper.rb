require 'pry'
require 'factory_girl'
require 'rspec/rails'

Rails.logger.level = 4

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = false
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

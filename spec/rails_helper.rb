ENV["RAILS_ENV"] ||= "test"
require "simplecov" if ENV["COVERAGE"] # should be before all files loading
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "vcr"

# fix for 100% files coverage
if ENV["COVERAGE"]
  Dir[Rails.root.join("app/models/**/*.rb")].each { |f| require f  }
  Dir[Rails.root.join("app/controllers/**/*.rb")].each { |f| require f  }
  Dir[Rails.root.join("app/lib/**/*.rb")].each { |f| require f  }
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.include FeatureHelpers, type: :feature
  config.include Devise::TestHelpers, type: :controller
  #config.include WaitForAjax
end
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
abort('The Rails environment is running in production mode!') \
  if Rails.env.production?
=======
abort("The Rails environment is running in production mode!") if Rails.env.production?
>>>>>>> setup doorkeeper
require 'spec_helper'
require 'rspec/rails'
require 'coveralls'
Coveralls.wear!('rails')
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

=======
abort("The Rails environment is running in production mode!") \
=======
abort('The Rails environment is running in production mode!') \
>>>>>>> fix rubocop issues
  if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'coveralls'
Coveralls.wear!('rails')

<<<<<<< HEAD
>>>>>>> write link model test
=======
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
<<<<<<< HEAD
>>>>>>> convert controller specs to feature tests
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
<<<<<<< HEAD
  config.fixture_path = "#{::Rails.root}/spec/factories"
=======
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
<<<<<<< HEAD

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
>>>>>>> setup doorkeeper
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
<<<<<<< HEAD
  config.include Requests::JsonHelpers, type: :request

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
=======
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
=======
=======

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/factories"
>>>>>>> add coveralls
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

<<<<<<< HEAD
>>>>>>> write link model test
=======
  config.include Requests::JsonHelpers, type: :request
<<<<<<< HEAD
<<<<<<< HEAD
  
>>>>>>> convert controller specs to feature tests
=======
=======
  config.include Requests::JsonHelpers, type: :controller
>>>>>>> refactor tests

>>>>>>> fix rubocop issues
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
<<<<<<< HEAD
>>>>>>> setup doorkeeper
end
=======
>>>>>>> fix rubocop issues

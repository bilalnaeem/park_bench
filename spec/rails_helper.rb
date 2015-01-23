# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'support/database_cleaner'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'capybara/rails'
require 'webmock/rspec'

ActiveRecord::Migration.check_pending!
include Devise::TestHelpers
include Warden::Test::Helpers
Warden.test_mode!
WebMock.allow_net_connect!
RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Capybara config
  Capybara.default_wait_time = 25
  if config.filter_manager.inclusions[:visual]
    Capybara.javascript_driver = :selenium
    config.filter_manager.inclusions.delete(:visual)
  else
    Capybara.javascript_driver = :poltergeist
    options = { timeout: 180, phantomjs_logger: StringIO.new, logger: nil, phantomjs_options: ['--ignore-ssl-errors=yes'] }
    Capybara.register_driver(:poltergeist) do |app|
      Capybara::Poltergeist::Driver.new app, options
    end
  end

  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, :type => :controller
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil
  def self.connection
    @@shared_connection || retrieve_connection
  end
end
# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
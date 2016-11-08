require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Buclist
  class Application < Rails::Application
  end
end

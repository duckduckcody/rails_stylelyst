require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stylelyst
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    Raven.configure do |config|
      config.dsn = 'https://b3ce02972e4348789d466834d8f4daf4:d67a92539b9b434b9b171fbe006b2e5b@sentry.io/1459668'
    end    
  end
end

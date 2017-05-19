require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SaveTheAnimalsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before Warden::Manager, Rack::Cors do
      allow do
        origins 'localhost:*', 'save-the-animals.herokuapp.com'
        resource '*', headers: :any, methods: :any
      end
    end

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end

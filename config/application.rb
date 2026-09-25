require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TheHub
  class Application < Rails::Application
    config.load_defaults 6.1

    config.session_store :cookie_store, key: "_the_hub_session"
    config.time_zone = "UTC"
  end
end

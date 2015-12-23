require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpotHyper
  class Application < Rails::Application
    # Autoload lib
    config.autoload_paths += Dir["#{config.root}/app/lib/*"]

    # Configure rails g to skip helper/assets files
    config.generators do |g|
      g.assets = false
      g.helper = false
      g.view_specs      false
      g.helper_specs    false
    end

    # Setup sidekiq
    config.active_job.queue_adapter = :sidekiq
  end
end

require_relative 'boot'
require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Dotenv::Railtie.load この行を削除

module Eatery
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      address: Rails.application.credentials.smtp[:address],
      domain: Rails.application.credentials.smtp[:domain],
      port: Rails.application.credentials.smtp[:port],
      user_name: Rails.application.credentials.smtp[:user_name],
      password: Rails.application.credentials.smtp[:password],
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end
end

if Object.constants.include? :Rails
  module Healthcheck
    class Railtie < Rails::Railtie
      initializer "healthcheck.configure_rails_initialization" do
        Rails.application.middleware.insert_before Rails::Rack::Logger, Healthcheck::Middleware
      end
    end
  end
end

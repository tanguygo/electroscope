# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.to_prepare do
  Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "dashboard" : "devise" }
end
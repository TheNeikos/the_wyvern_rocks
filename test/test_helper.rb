ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Kernel.silence_warnings {
  BCrypt::Engine::DEFAULT_COST = 1
}

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def create_password
    BCrypt::Password.create("what")
  end
end

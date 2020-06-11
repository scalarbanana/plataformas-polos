# frozen_string_literal: true
require('devise')

RSpec.configure do |config|
  config.include(Warden::Test::Helpers)
  config.include(Devise::Test::ControllerHelpers, type: :controller)
  config.after do
    Warden.test_reset!
  end
end

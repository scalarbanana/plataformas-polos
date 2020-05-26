# frozen_string_literal: true

require('faker')

RSpec.configure do |config|
  config.before(:suite) do
    Faker::Config.locale = :en
    I18n.reload!
  end
end

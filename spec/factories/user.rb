# frozen_string_literal: true

require('support/faker')

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    factory :admin do
      roles { [:admin] }
    end

    factory :user_cartografia do
      roles { [:cartografia] }
    end
  end
end

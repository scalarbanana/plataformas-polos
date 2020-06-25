# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    trait :admin do
      permissions { [:admin] }
    end

    trait :tecitura do
      permissions { [:tecitura] }
    end

    trait :cartografia do
      permissions { [:cartografia] }
    end
  end
end

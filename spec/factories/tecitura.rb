# frozen_string_literal: true

FactoryBot.define do
  factory :tecitura do
    nome { Faker::Name.feminine_name }
    endereco { Faker::Address.full_address }
    vinc_ano { 2020 }
    vinc_semestre { 1 }

    trait :relatorio do
      after(:create) do |tecitura|
        create_list(:relatorio, 1, tecitura: tecitura)
      end
    end
  end
end

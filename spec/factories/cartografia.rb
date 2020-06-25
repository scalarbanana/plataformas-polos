# frozen_string_literal: true

FactoryBot.define do
  factory :cartografia do
    questao { rand(1..3) }
    resumo { Faker::Lorem.sentence(word_count: 10) }
    fonte { Faker::Internet.url }
    local { Faker::Address.country }
    data { Faker::Date.in_date_period(year: 2020) }
    descricao { Faker::Lorem.sentences(number: 10).join('\n') }
    temas { Faker::Lorem.words(number: 4).join(', ') }
    responsavel { Faker::Name.first_name }
  end
end

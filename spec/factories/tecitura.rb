# frozen_string_literal: true

require('support/faker')

FactoryBot.define do
  factory :endereco do
    texto { Faker::Address.full_address }
    coordenadas { [Faker::Address.longitude, Faker::Address.latitude] }
  end

  factory :mulher_acompanhada, class: 'Contato' do
    nome { Faker::Name.feminine_name }
    telefone { Faker::PhoneNumber.cell_phone }
    endereco
  end

  factory :tecitura do
    mulher_acompanhada
    vinculacao_ano { 2020 }
    vinculacao_semestre { 1 }
  end
end

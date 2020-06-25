# frozen_string_literal: true

class Cartografia < ApplicationRecord
  extend Enumerize

  attribute :questao
  attribute :resumo
  attribute :fonte
  attribute :local
  attribute :referencias
  attribute :data, :date
  attribute :descricao
  attribute :temas
  attribute :observacoes
  attribute :citacoes
  attribute :responsavel

  enumerize :questao, in: %i[1 2 3 4]

  validates :questao,
            :resumo,
            :fonte,
            :local,
            :data,
            :descricao,
            :temas,
            :responsavel,
            presence: true
  validates :temas, length: { maximum: 70 }
  validates :resumo, :local, :temas, length: { maximum: 140 }
end

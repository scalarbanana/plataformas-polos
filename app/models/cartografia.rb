# frozen_string_literal: true

class Cartografia
  include Mongoid::Document
  include Mongoid::Timestamps

  field :resumo
  field :fonte
  field :local
  field :referencias
  field :data, type: Date
  field :descricao
  field :temas
  field :observacoes
  field :citacoes
  field :responsavel

  validates :resumo, :fonte, :local, :data, :descricao, :temas, :responsavel, presence: true
  validates :temas, length: { maximum: 70 }
  validates :resumo, :local, :temas, length: { maximum: 140 }
  # Apenas por segurança (ver https://stackoverflow.com/questions/417142/what-is-the-maximum-length-of-a-url-in-different-browsers)
  validates :fonte, length: { maximum: 2000 }
end

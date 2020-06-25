# frozen_string_literal: true

class Tecitura < ApplicationRecord
  extend Enumerize

  attribute :id, :uuid

  attribute :nome
  attribute :telefone, :phone
  attribute :endereco

  attribute :vinc_ano, :integer
  attribute :vinc_semestre, :integer

  attribute :situacao_atual
  attribute :nucleo_familiar
  attribute :regiao
  attribute :situacao_acolhimento
  attribute :ref_atencao_primaria
  attribute :ref_assistencia_social
  attribute :vinc_familiares_comunitarios
  attribute :situacao_juridica

  attribute :equipe_tecitura
  attribute :ref_padhu
  attribute :responsaveis

  has_many :relatorios, dependent: :destroy

  geocoded_by :endereco
  enumerize :situacao_atual, in: %w[ativo em_monitoramento], default: 'ativo'
  accepts_nested_attributes_for :relatorios,
                                allow_destroy: true

  validates :nome, presence: true
  validates :telefone, phone: { allow_blank: true }
  validates :vinc_ano,
            numericality: {
              allow_blank: false,
              only_integer: true,
              less_than_or_equal_to: ->(_) { Date.current.year },
              greater_than_or_equal_to: 2000
            }
  validates :vinc_semestre,
            numericality: {
              allow_blank: false,
              only_integer: true,
              less_than_or_equal_to: 2,
              greater_than_or_equal_to: 1
            }

  after_validation :geocode, if: ->(obj) { obj.endereco_changed? }
end

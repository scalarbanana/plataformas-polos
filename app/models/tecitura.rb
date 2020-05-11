# frozen_string_literal: true

class Tecitura
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vinculacao_ano, type: Integer
  field :vinculacao_semestre, type: Integer
  field :situacao_atual, type: String
  field :nucleo_familiar, type: String
  field :regiao, type: String
  field :situacao_acolhimento, type: String
  field :ref_atencao_primaria, type: String
  field :ref_assistencia_social, type: String
  field :vinc_familiares_comunitarios, type: String
  field :situacao_juridica, type: String
  field :relatorios, type: String
  field :equipe_tecitura, type: String
  field :ref_padhu, type: String
  field :responsaveis, type: String

  embeds_one :mulher_acompanhada, class_name: 'Contato'
  embeds_many :contatos

  accepts_nested_attributes_for :mulher_acompanhada, :contatos

  validates :vinculacao_ano,
            numericality: {
              allow_blank: false,
              only_integer: true,
              less_than_or_equal_to: ->(_) { Date.current.year },
              greater_than: 2000
            }
  validates :vinculacao_semestre,
            numericality: {
              allow_blank: false,
              only_integer: true,
              less_than_or_equal_to: 2,
              greater_than_or_equal_to: 1
            }
end

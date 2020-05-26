# frozen_string_literal: true

class Tecitura
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :vinculacao_ano, type: Integer
  field :vinculacao_semestre, type: Integer
  field :situacao_atual, type: Symbol
  field :nucleo_familiar
  field :regiao
  field :situacao_acolhimento
  field :ref_atencao_primaria
  field :ref_assistencia_social
  field :vinc_familiares_comunitarios
  field :situacao_juridica
  field :equipe_tecitura
  field :ref_padhu
  field :responsaveis

  enumerize :situacao_atual, in: %i[ativo em_monitoramento], default: :ativo
  embeds_one :mulher_acompanhada, class_name: 'Contato', autobuild: true
  embeds_many :relatorios, cascade_callbacks: true

  accepts_nested_attributes_for :mulher_acompanhada
  accepts_nested_attributes_for :relatorios,
                                allow_destroy: true

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

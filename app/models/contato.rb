# frozen_string_literal: true

class Contato
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :tecitura

  field :nome, type: String
  field :telefone, type: Types::Phone
  embeds_one :endereco

  accepts_nested_attributes_for :endereco

  validates :telefone, phone: { possible: true, allow_blank: true }
end

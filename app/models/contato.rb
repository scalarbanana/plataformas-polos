# frozen_string_literal: true

class Contato
  include Mongoid::Document

  field :nome
  field :telefone, type: Types::Phone

  embeds_one :endereco, autobuild: true

  accepts_nested_attributes_for :endereco

  validates :telefone, phone: { possible: true, allow_blank: true }
end

# frozen_string_literal: true

class Endereco
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  embedded_in :contato

  field :texto, type: String
  field :coordenadas, type: Array

  geocoded_by :texto, coordinates: :coordenadas
  after_validation :geocode, coordinates: :coordenadas, if: :texto_changed?
end

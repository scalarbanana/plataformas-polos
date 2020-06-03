# frozen_string_literal: true

class Relatorio < ApplicationRecord
  include ReportUploader::Attachment(:documento)

  attribute :documento_data, :jsonb
  attribute :ano, :integer
  attribute :semestre, :integer

  belongs_to :tecitura

  validates :documento, :semestre, :ano, presence: true
  validates :ano,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: ->(_) { Date.current.year },
              greater_than_or_equal_to: 2000
            }
  validates :semestre,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: 2,
              greater_than_or_equal_to: 1
            }
end

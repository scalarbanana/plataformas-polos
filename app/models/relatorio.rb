# frozen_string_literal: true

class Relatorio
  include Mongoid::Document
  include Mongoid::Timestamps
  include ReportUploader::Attachment(:document)

  field :document_data, type: Hash
  field :ano, type: Integer
  field :semestre, type: Integer

  embedded_in :tecitura

  after_save do
    document_attacher.__send__(:mongoid_after_save)
  end
  # Solução temporária para https://github.com/shrinerb/shrine-mongoid/issues/5
  after_destroy do
    document_attacher.__send__(:mongoid_after_destroy)
  end

  validates :ano,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: ->(_) { Date.current.year },
              greater_than: 2000
            }
  validates :semestre,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: 2,
              greater_than_or_equal_to: 1
            }
  validates :document, :semestre, :ano, presence: true
end

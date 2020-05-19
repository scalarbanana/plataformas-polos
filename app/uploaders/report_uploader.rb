# frozen_string_literal: true

class ReportUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  plugin :download_endpoint, prefix: 'uploads/reports'

  Attacher.validate do
    validate_mime_type %w[application/pdf]
  end
end

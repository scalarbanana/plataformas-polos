# frozen_string_literal: true

require('shrine/storage/memory')

FactoryBot.define do
  factory :relatorio do
    ano { rand(2000..2020) }
    semestre { rand(1..2) }
    documento_data do
      attacher = ReportUploader::Attacher.new

      File.open('spec/support/files/dummy.pdf', binmode: true) do |file|
        uploaded_file = Shrine.upload(file, :store, metadata: false)
        uploaded_file.metadata.merge!(
          size: File.size(file.path),
          mime_type: 'application/pdf',
          extention: 'pdf',
          filename: 'dummy.pdf'
        )
        attacher.set(uploaded_file)
      end

      attacher.data
    end
  end
end

# frozen_string_literal: true

require('shrine')
require('shrine/storage/file_system')

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('tmp', prefix: 'uploads'),
  store: Shrine::Storage::FileSystem.new('uploads', prefix: 'attachments')
}

Shrine.plugin(:activerecord)
Shrine.plugin(:pretty_location, class_underscore: :true) # rubocop:disable Lint/BooleanSymbol
Shrine.plugin(:determine_mime_type, analyzer: :marcel)

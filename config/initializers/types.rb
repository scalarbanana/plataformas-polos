# frozen_string_literal: true

Dir[Rails.root.join('lib/types/*.rb')].sort.each { |f| require f }

ActiveRecord::Type.register(:phone, Types::Phone)

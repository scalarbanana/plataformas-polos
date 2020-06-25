# frozen_string_literal: true

module  Types
  class Phone < ActiveRecord::Type::String
    def cast(value)
      return value unless Phonelib.possible?(value)

      Phonelib::Phone.new(value)
    end

    def serialize(value)
      if value.is_a?(Phonelib::Phone)
        value.full_e164
      else
        value
      end
    end
  end
end

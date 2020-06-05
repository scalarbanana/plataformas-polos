# frozen_string_literal: true

module  Types
  class Phone < ActiveRecord::Type::String
    def cast(value)
      return value unless Phonelib.possible?(value)

      Phonelib::Phone.new(value)
    end

    def deserialize(value)
      Phonelib::Phone.new(value)
    end

    def serialize(value)
      value.full_e164
    end
  end
end

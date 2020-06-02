# frozen_string_literal: true

module  Types
  class Phone < ActiveRecord::Type::String
    def cast(value)
      Types::Phone.new(value)
    end

    def serialize(value)
      case value
      when Phonelib::Phone
        value.full_e164
      else
        value.to_s
      end
    end
  end
end

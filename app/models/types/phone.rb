# frozen_string_literal: true

module  Types
  class Phone < Phonelib::Phone
    def initialize(phone)
      super(phone, 'br')
    end

    # Converts an object of this instance into a database friendly value.
    def mongoize
      full_e164
    end

    class << self
      # Get the object as it was stored in the database, and instantiate
      # this custom class from it.
      def demongoize(object)
        Types::Phone.new(object)
      end

      # Takes any possible object and converts it to how it would be
      # stored in the database.
      def mongoize(object)
        case object
        when Types::Phone
          object.mongoize
        when Phonelib::Phone, String
          Types::Phone.new(object).mongoize
        else
          ''
        end
      end

      # Converts the object that was supplied to a criteria and converts it
      # into a database friendly form.
      def evolve(object)
        case object
        when Types::Phone
          object.mongoize
        else
          object
        end
      end
    end
  end
end

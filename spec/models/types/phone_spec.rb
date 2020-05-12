# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Types::Phone) do
  context 'with a valid phone number' do
    describe 'serialization' do
      phone = Faker::PhoneNumber.cell_phone_in_e164
      subject(:phone_instance) { described_class.new(phone) }

      it 'transforms Types::Phone into a e164 string' do
        expect(phone_instance.mongoize).to(eq(phone))
      end

      it 'transforms Phonelib into a e164 string' do
        expect(described_class.mongoize(Phonelib.parse(phone))).to(eq(phone))
      end

      it 'transforms String into a e164 string' do
        phone_string = Faker::PhoneNumber.cell_phone_with_country_code
        expect(described_class.mongoize(phone_string))
          .to(eq(Phonelib.parse(phone_string).full_e164))
      end
    end

    describe 'deserialization' do
      phone = Faker::PhoneNumber.cell_phone_in_e164
      subject(:phone_instance) { described_class.demongoize(phone) }

      it 'creates a Types::Phone instance' do
        expect(phone_instance).to(be_a(described_class))
      end

      it 'creates a valid Phonelib instance' do
        expect(phone_instance).to(be_valid)
      end
    end
  end
end

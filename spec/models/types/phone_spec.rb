# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::Phone do
  context 'with a valid phone number' do
    describe 'serialization' do
      phone = Faker::PhoneNumber.cell_phone_in_e164
      subject { Types::Phone.new(phone) }
      it 'transforms Types::Phone into a e164 string' do
        expect(subject.mongoize).to eq(phone)
        expect(Types::Phone.mongoize(subject)).to eq(phone)
      end
      it 'transforms Phonelib into a e164 string' do
        expect(Types::Phone.mongoize(Phonelib.parse(phone))).to eq(phone)
      end
      it 'transforms String into a e164 string' do
        phone_string = Faker::PhoneNumber.cell_phone_with_country_code
        expect(Types::Phone.mongoize(phone_string))
          .to(eq(Phonelib.parse(phone_string).full_e164))
      end
    end
    describe 'deserialization' do
      phone = Faker::PhoneNumber.cell_phone_in_e164
      subject { Types::Phone.demongoize(phone) }
      it 'creates a Types::Phone instance' do
        expect(subject).to be_a(Types::Phone)
      end
      it 'creates a valid Phonelib instance' do
        expect(subject.valid?).to be_truthy
      end
    end
  end
end

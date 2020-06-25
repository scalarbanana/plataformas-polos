# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Types::Phone) do
  let(:phone) { Faker::PhoneNumber.cell_phone_in_e164 }

  describe 'cast' do
    it('casts a string to Phonelib instance') {
      expect(described_class.new.cast(phone)).to(eq(Phonelib.parse(phone)))
    }
  end

  describe 'deserialize' do
    it('converts a string to a Phonelib object') {
      expect(described_class.new.deserialize(phone)).to(eq(Phonelib.parse(phone)))
    }
  end

  describe 'serialize' do
    it('casts a Phonelib::Phone to string') {
      expect(described_class.new.serialize(Phonelib.parse(phone))).to(eq(phone))
    }
  end
end

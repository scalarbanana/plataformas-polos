# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_values([], [:user], [:admin]).for(:roles) }
    it { is_expected.to_not allow_values([:else]).for(:roles) }
  end
end

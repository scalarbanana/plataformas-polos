# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Aporo, type: :model) do
  context 'when validating' do
    it { is_expected.to validate_presence_of(:titulo) }
    it { is_expected.to validate_presence_of(:pesquisadores) }
    it { is_expected.to validate_presence_of(:acoes_polos) }
  end
end

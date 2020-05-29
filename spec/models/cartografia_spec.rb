# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Cartografia, type: :model) do
  context 'when validating' do
    it { is_expected.to(validate_presence_of(:resumo)) }
    it { is_expected.to(validate_presence_of(:fonte)) }
    it { is_expected.to(validate_presence_of(:local)) }
    it { is_expected.to(validate_presence_of(:data)) }
    it { is_expected.to(validate_presence_of(:descricao)) }
    it { is_expected.to(validate_presence_of(:temas)) }
    it { is_expected.to(validate_presence_of(:responsavel)) }

    it { is_expected.to(validate_length_of(:temas).is_at_most(70)) }

    it { is_expected.to(validate_length_of(:resumo).is_at_most(140)) }
    it { is_expected.to(validate_length_of(:local).is_at_most(140)) }
    it { is_expected.to(validate_length_of(:temas).is_at_most(140)) }
  end
end

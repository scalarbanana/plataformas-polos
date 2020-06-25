# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Relatorio, type: :model) do
  context 'when validating' do
    it { is_expected.to(validate_presence_of(:documento)) }

    it {
      is_expected.to(validate_numericality_of(:ano)
                         .is_less_than_or_equal_to(Date.current.year)
                         .is_greater_than_or_equal_to(2000)
                         .only_integer)
    }

    it {
      is_expected.to(validate_numericality_of(:semestre)
                         .is_less_than_or_equal_to(2)
                         .is_greater_than_or_equal_to(1)
                         .only_integer)
    }
  end

  it { is_expected.to(belong_to(:tecitura)) }
end

# frozen_string_literal: true

require('rails_helper')

RSpec.describe(Tecitura, type: :model) do
  it { is_expected.to(validate_presence_of(:nome)) }

  it {
    is_expected.to(validate_numericality_of(:vinc_ano)
                          .is_less_than_or_equal_to(Date.current.year)
                          .is_greater_than_or_equal_to(2000)
                          .only_integer)
  }

  it {
    is_expected.to(validate_numericality_of(:vinc_semestre)
                       .is_less_than_or_equal_to(2)
                       .is_greater_than_or_equal_to(1)
                       .only_integer)
  }

  it { is_expected.to(enumerize(:situacao_atual).in(:ativo, :em_monitoramento)) }

  it('is expected to not allow phone numbers without area code') {
    is_expected.not_to(allow_value('1234-5678').for(:telefone))
  }

  it('is expected to allow valid phone numbers') {
    is_expected.to(allow_value('(31) 3123-5678').for(:telefone))
  }

  it('is expected to allow valid cellphone numbers') {
    is_expected.to(allow_value('(31) 9 1234-5678').for(:telefone))
  }

  it { is_expected.to(have_many(:relatorios)) }
end

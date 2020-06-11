# frozen_string_literal: true

require('rails_helper')
require('support/factory_bot')
require('support/devise')

RSpec.describe(TeciturasController, type: :controller) do
  subject(:controller) { described_class }

  before do
    user = create(:user, :tecitura)
    sign_in(user)
  end

  it do
    params = { tecitura: attributes_for(
      :tecitura,
      telefone: '',
      situacao_atual: '',
      nucleo_familiar: '',
      regiao: '',
      situacao_acolhimento: '',
      ref_atencao_primaria: '',
      ref_assistencia_social: '',
      vinc_familiares_comunitarios: '',
      situacao_juridica: '',
      equipe_tecitura: '',
      ref_padhu: '',
      responsaveis: ''
    ) }
    expect(controller).to permit(
      :nome,
      :endereco,
      :vinc_ano,
      :vinc_semestre,
      :telefone,
      :situacao_atual,
      :nucleo_familiar,
      :regiao,
      :situacao_acolhimento,
      :ref_atencao_primaria,
      :ref_assistencia_social,
      :vinc_familiares_comunitarios,
      :situacao_juridica,
      :equipe_tecitura,
      :ref_padhu,
      :responsaveis
    ).for(:create, params: params)
  end
end

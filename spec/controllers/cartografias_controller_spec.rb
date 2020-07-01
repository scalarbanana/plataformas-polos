# frozen_string_literal: true

require('rails_helper')
require('support/factory_bot')
require('support/devise')

# TODO: substitute for richer feature and model specs
RSpec.describe(CartografiasController, type: :controller) do
  subject(:controller) { described_class }

  before do
    user = create(:user, :cartografia)
    sign_in(user)
  end

  it do
    params = { cartografia: attributes_for(
      :cartografia,
      referencias: '',
      observacoes: '',
      citacoes: ''
    ) }
    expect(controller).to permit(
      :questao,
      :resumo,
      :fonte,
      :local,
      :referencias,
      :data,
      :descricao,
      :temas,
      :observacoes,
      :citacoes,
      :responsavel
    ).for(:create, params: params)
  end
end

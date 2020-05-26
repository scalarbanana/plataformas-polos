# frozen_string_literal: true

require('rails_helper')
require('support/devise')
require('support/factory_bot')

RSpec.describe('Módulo Cartografias', type: :feature) do
  before do
    login_as(create(:user_cartografia))
  end

  it 'User navigates to module' do
    visit('/')
    click_link('PADHu/Cartografias')
    expect(page).to(have_xpath('h2[text()="PADHu/Cartografias"]'))
    expect(page).to(have_css('table'))
    expect(page).to(have_link('Adicionar Entrada'))
  end

  it 'User creates a new entry' do
    visit(cartografias_path)
    click_link('Registrar entrada')
    fill_in
  end
end

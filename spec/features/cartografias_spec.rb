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
    click_link('Cartografias')
    expect(page).to(have_css('table'))
    expect(page).to(have_link('Criar nova entrada'))
  end

  it 'User creates a new entry' do
    pending('too many changes')
    visit(cartografias_path)
    click_link('Criar nova entrada')
    fill_in 'Fonte', 'url'
  end
end

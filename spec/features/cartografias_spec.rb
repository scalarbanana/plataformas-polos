# frozen_string_literal: true

require('rails_helper')
require('support/devise')
require('support/factory_bot')

RSpec.describe('Módulo Cartografias', type: :feature) do
  let(:user) { create(:user_cartografia) }

  before { login_as(user) }

  after { user.destroy! }

  it 'User navigates to module' do
    visit('/')
    click_link('Cartografias')
    expect(page).to(have_css('table'))
    expect(page).to(have_link('Criar nova entrada'))
  end
end

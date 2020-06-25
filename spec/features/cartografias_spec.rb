# frozen_string_literal: true

require('rails_helper')
require('support/devise')
require('support/factory_bot')

RSpec.describe('Cartografias', type: :feature) do
  before { login_as(create(:user, :cartografia)) }

  it 'user navigates to module' do
    visit('/')

    click_link('Cartografias')

    expect(page).to(have_css('table'))
    expect(page).to(have_link('Criar nova entrada'))
  end
end

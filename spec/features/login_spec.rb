# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  scenario 'User tries to access without logging in' do
    visit '/'
    expect(page).to have_current_path(new_user_session_url)
    expect(page).to have_text('Para continuar, faça login ou registre-se.')
  end

  scenario 'User logs in with incorrect credentials' do
    visit new_user_session_url
    fill_in 'E-mail', with: 'test@mail.com'
    fill_in 'Senha', with: 'wrongpass'
    click_on 'Login'
    expect(page).to have_current_path(new_user_session_url)
    expect(page).to have_text('E-mail ou senha inválidos.')
  end

  scenario 'User logs in with correct credentials' do
    visit new_user_session_url
    fill_in 'E-mail', with: 'test@mail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Login'
    expect(page).to have_current_path(root_url)
    expect(page).to have_text('Login efetuado com sucesso.')
  end
end

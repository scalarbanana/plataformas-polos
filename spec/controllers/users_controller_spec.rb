# frozen_string_literal: true

require('rails_helper')
require('support/factory_bot')
require('support/devise')

RSpec.describe(UsersController, type: :controller) do
  subject(:controller) { described_class }

  context 'when user is not an admin' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    it 'permits basic attributes, filters :permissions' do
      params = { id: user.id, user: attributes_for(:user, permissions: [:admin]) }
      expect(controller).to permit(
        :name,
        :email,
        :password,
        :password_confirmation
      ).for(:update, params: params)
    end
  end

  context 'when user is an admin' do
    before do
      user = create(:user, :admin)
      sign_in(user)
    end

    it 'permits full attributes' do
      params = { user: attributes_for(:user, permissions: %i[admin tecitura cartografia]) }
      expect(controller).to permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        permissions: []
      ).for(:create, params: params)
    end
  end
end

# frozen_string_literal: true

require('rails_helper')
require('support/pundit')
require('support/factory_bot')

def user_scope(user)
  Pundit.policy_scope!(user, User)
end

RSpec.describe(UserPolicy, type: :policy) do
  subject { described_class }

  context 'when user is authenticated' do
    permissions :index? do
      it('can index users') { is_expected.to permit(build_stubbed(:user), User) }
    end
  end

  context 'when user is not an admin' do
    let(:user) { build_stubbed(:user) }

    permissions :show?, :update? do
      it 'can see and edit their account' do
        is_expected.to permit(user, user)
      end
    end

    permissions :show?, :create?, :update?, :destroy? do
      it 'cannot create or edit other users or destroy their own' do
        is_expected.not_to permit(user, build_stubbed(:user))
      end
    end

    permissions :update_roles? do
      it 'cannot change their roles' do
        is_expected.not_to permit(user, user)
      end
    end
  end

  context 'when user is an admin' do
    let(:admin) { build_stubbed(:user, :admin) }

    permissions :show?, :create?, :update?, :update_roles?, :destroy? do
      it 'has full access to users' do
        is_expected.to permit(admin, build_stubbed(:user))
      end
    end
  end

  permissions '::Scope' do
    before do
      create(:user)
      create(:user, :cartografia)
      create(:user, :tecitura)
    end

    context 'when user has no permissions' do
      it 'shows only themself' do
        user = create(:user)
        expect(user_scope(user)).to match_array([user])
      end
    end

    context 'when user is not an admin' do
      it 'shows only users with the same permissions' do # rubocop:disable RSpec/MultipleExpectations, RSpec/ExampleLength
        expect(user_scope(build_stubbed(:user, :tecitura)).to_a).to(
          all(satisfy { |u| u.permissions.tecitura? })
        )
        expect(user_scope(build_stubbed(:user, :cartografia)).to_a).to(
          all(satisfy { |u| u.permissions.cartografia? })
        )
      end
    end

    context 'when user is an admin' do
      it 'shows all users' do
        expect(user_scope(build_stubbed(:user, :admin)).count).to equal(3)
      end
    end
  end
end

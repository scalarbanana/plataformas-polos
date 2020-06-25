# frozen_string_literal: true

require('rails_helper')
require('support/pundit')
require('support/factory_bot')

RSpec.describe(ApplicationPolicy) do
  subject { described_class }

  it 'raises Pundit::NotAuthorizedError without user' do
    expect { described_class.new(nil, Object.new) }.to(raise_error(Pundit::NotAuthorizedError))
  end

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "denies access if user doesn't have `admin` role" do
      is_expected.not_to(permit(build(:user), Object.new))
    end

    it 'allows access if user has `admin` role' do
      is_expected.to(permit(build(:user, :admin), Object.new))
    end
  end

  describe '::Scope' do
    subject(:scope) { ApplicationPolicy::Scope }

    it 'raises Pundit::NotAuthorizedError without user' do
      expect { scope.new(nil, Object.new) }.to(raise_error(Pundit::NotAuthorizedError))
    end

    describe '#resolve' do
      it 'aplies .all model scope' do
        model = spy('model') # rubocop:disable RSpec/VerifiedDoubles
        scope.new(build(:user), model).resolve

        expect(model).to(have_received(:all))
      end
    end
  end
end

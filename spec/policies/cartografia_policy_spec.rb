# frozen_string_literal: true

require('rails_helper')
require('support/pundit')
require('support/factory_bot')

RSpec.describe(CartografiaPolicy) do
  subject { described_class }

  permissions :index?, :show?, :create?, :update?, :destroy? do
    it "denies access if user doesn't have `cartografia` role" do
      is_expected.not_to(permit(build(:user), Cartografia.new))
    end

    it 'allows access if user has `cartografia` role' do
      is_expected.to(permit(build(:user, roles: [:cartografia]), Cartografia.new))
    end

    it 'allows access if user has `admin` role' do
      is_expected.to(permit(build(:admin), Cartografia.new))
    end
  end
end

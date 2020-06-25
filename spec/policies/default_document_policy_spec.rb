# frozen_string_literal: true

require('rails_helper')
require('support/pundit')
require('support/factory_bot')

RSpec.shared_examples_for('a default document policy') do
  subject { described_class }

  let(:model_class)      { Object.const_get(described_class.name.delete_suffix('Policy')) }
  let(:model_permission) { described_class.name.delete_suffix('Policy').downcase.to_sym   }

  permissions :index?, :show?, :create?, :update?, :destroy? do
    it "denies access if user doesn't have permission" do
      is_expected.not_to(permit(build_stubbed(:user), model_class))
    end

    it 'allows access if user has document permission' do
      is_expected.to(permit(build_stubbed(:user, model_permission), model_class))
    end

    it 'allows access if user has `admin` role' do
      is_expected.to(permit(build_stubbed(:user, :admin), model_class))
    end
  end
end

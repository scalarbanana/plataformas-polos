# frozen_string_literal: true

require('spec_helper')
require('rails_helper')

RSpec.describe(ApplicationController, type: :controller) do
  it { is_expected.to filter_param(:password) }
  it { is_expected.to filter_param(:password_confirmation) }
  it { is_expected.to filter_param(:token) }
end

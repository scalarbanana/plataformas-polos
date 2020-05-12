# frozen_string_literal: true

# rubocop:disable Rails/LexicallyScopedActionFilter

class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
end
# rubocop:enable Rails/LexicallyScopedActionFilter

# frozen_string_literal: true

class TecituraPolicy < ApplicationPolicy
  def index?
    user.roles.tecitura?
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end

  def destroy?
    roles = user.roles
    roles.tecitura? && roles.admin?
  end
end

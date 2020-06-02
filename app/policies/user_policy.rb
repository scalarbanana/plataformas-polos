# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.permissions.admin? || record == user
  end

  def create?
    user.permissions.admin?
  end

  def update?
    user.permissions.admin? || record == user
  end

  def update_roles?
    user.permissions.admin?
  end

  def destroy?
    user.permissions.admin? && record != user
  end

  class Scope < Scope
    def resolve
      permissions = user.permissions
      if permissions.admin?
        scope.all
      else
        scope.in(permissions: permissions.map(&:to_sym))
      end
    end
  end
end

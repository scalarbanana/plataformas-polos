# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.roles.admin? || record == user
  end

  def create?
    user.roles.admin?
  end

  def update?
    user.roles.admin? || record == user
  end

  def update_roles?
    user.roles.admin?
  end

  def destroy?
    user.roles.admin? && record != user
  end

  class Scope < Scope
    def resolve
      roles = user.roles
      if roles.admin?
        scope.all
      else
        scope.in(roles: roles.map(&:to_sym))
      end
    end
  end
end

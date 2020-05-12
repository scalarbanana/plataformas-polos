# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise(Pundit::NotAuthorizedError) unless user

    @user   = user
    @record = record
  end

  def index?
    user.roles.admin?
  end

  def show?
    user.roles.admin?
  end

  def create?
    user.roles.admin?
  end

  def new?
    create?
  end

  def update?
    user.roles.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.roles.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise(Pundit::NotAuthorizedError) unless user

      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end

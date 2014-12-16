class BoxPolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.admin
  end

  def new?
    create?
  end

  def update?
    user.admin
  end

  def edit?
    update?
  end

  def destroy?
    user.admin
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user && user.admin?
          scope.all
      end
    end
  end
end
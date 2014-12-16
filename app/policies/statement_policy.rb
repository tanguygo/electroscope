class StatementPolicy < ApplicationPolicy

  def index?
    true
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user
        if user.admin?
          scope.all
        else
          user.statements
        end
      end
    end

  end

end
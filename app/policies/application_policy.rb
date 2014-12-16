class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    record.user == user || user.admin
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
      if user
        if user.admin?
          scope.all
        else
          scope.where(:user => user)
        end
      end
    end
  end
end


class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    valid_and_admin user
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    valid_and_admin user
  end

  def new?
    create?
  end

  def update?
    valid_and_admin user
  end

  def edit?
    update?
  end

  def destroy?
    valid_and_admin user
  end

  def valid_and_admin user
    user and user.is_admin
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
      scope
    end

    def valid_and_admin user
      user and user.is_admin
    end
  end
end


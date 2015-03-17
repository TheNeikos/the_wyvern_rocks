class ApplicationPolicy
  attr_reader :member, :record

  def initialize(member, record)
    @member = member
    @record = record
  end

  def index?
    member and member.is_admin
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    member and member.is_admin
  end

  def new?
    create?
  end

  def update?
    member and member.is_admin
  end

  def edit?
    update?
  end

  def destroy?
    member and member.is_admin
  end

  def scope
    Pundit.policy_scope!(member, record.class)
  end

  class Scope
    attr_reader :member, :scope

    def initialize(member, scope)
      @member = member
      @scope = scope
    end

    def resolve
      scope
    end
  end
end


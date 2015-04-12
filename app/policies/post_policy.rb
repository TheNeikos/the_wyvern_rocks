class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and (user.is_admin or user)
        scope.with_deleted
      else
        scope.all
      end
    end
  end

  def create?
    user
  end

  def update?
    user && (user.is_admin || record.user == user)
  end

  def destroy?
    user && user.is_admin
  end
end

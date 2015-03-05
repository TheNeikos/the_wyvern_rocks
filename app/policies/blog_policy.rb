class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and user.is_admin
        scope.all
      else
        scope.all
      end
    end
  end

  def update?
    user and (user.is_admin || record.user == user)
  end

  def create?
    user
  end
end

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin
        scope.all
      else
        scope.all
      end
    end
  end

  def index?
    true
  end

  def logout?
    user
  end
end

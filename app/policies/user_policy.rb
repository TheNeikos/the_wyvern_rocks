class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if false #user.admin?
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

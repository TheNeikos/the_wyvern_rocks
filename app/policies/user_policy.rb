class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and user.is_admin
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

  def new?
    user and (user == record or user.is_admin)
  end

  def update?
    user and (user == record or user.is_admin)
  end
end

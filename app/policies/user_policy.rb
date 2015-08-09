class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if valid_and_admin user
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

  def create?
    return false if GlobalSetting[:registrations_enabled].value == '0'
    return false if user and not user.is_admin
    true
  end

  def update?
    user and (user == record or user.is_admin)
  end
end

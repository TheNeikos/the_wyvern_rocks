class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if member and member.is_admin
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
    member
  end

  def create?
    return false if GlobalSetting[:registrations_enabled].value == '0'
    return false if member and not member.is_admin
    true
  end

  def update?
    member and (member == record or member.is_admin)
  end
end

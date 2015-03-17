class GlobalSettingPolicy < ApplicationPolicy
  def index?
    member and member.is_admin
  end
end

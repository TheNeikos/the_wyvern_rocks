class GlobalSettingPolicy < ApplicationPolicy
  def index?
    user and user.is_admin
  end
end

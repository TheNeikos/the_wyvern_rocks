class GlobalSettingPolicy < ApplicationPolicy
  def index?
    valid_and_admin user
  end
end

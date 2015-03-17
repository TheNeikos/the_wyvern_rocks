class DashboardCategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and user.is_admin
        scope.all
      else
        scope.all
      end
    end
  end

  def show?
    true
  end
end

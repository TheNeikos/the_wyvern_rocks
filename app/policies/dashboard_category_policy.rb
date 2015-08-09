class DashboardCategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if valid_and_admin user
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

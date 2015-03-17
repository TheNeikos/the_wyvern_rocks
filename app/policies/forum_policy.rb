class ForumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if member and member.is_admin
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

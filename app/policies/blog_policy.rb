class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if member and member.is_admin
        scope.all
      else
        scope.all
      end
    end
  end

  def update?
    member and (member.is_admin || record.member == member)
  end

  def create?
    member
  end
end

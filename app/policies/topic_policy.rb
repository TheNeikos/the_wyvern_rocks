class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if member and member.is_admin
        scope.all
      else
        scope.all
      end
    end
  end

  def create?
    member
  end

  def update?
    member && (member.is_admin || record.member == member)
  end
end

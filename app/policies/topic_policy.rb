class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and (user.is_admin or user)
        scope.with_deleted
      else
        scope.all
      end
    end
  end

  def create?
    user
  end

  def update?
    user && ([
      record.user == user,
      record.closed_at.nil?,
    ].all? || user.is_admin)
  end

  def destroy?
    user && user.is_admin
  end

  def lock?
    false
  end

  def pin?
    user && user.is_admin
  end
end

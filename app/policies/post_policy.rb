class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and (user.is_admin or user)
        scope.with_deleted
      else
        scope.all
      end
    end
  end

  def permitted_attributes
    if user && user.is_admin
      [:title, :content, :closed_at]
    else
      [:title, :content]
    end
  end

  def create?
    user && ([
      record.topic.closed_at.nil?,
    ].all? || user.is_admin)
  end

  def update?
    user && ([
      record.user == user,
      record.topic.closed_at.nil?,
    ].all? || user.is_admin)
  end

  def destroy?
    user && user.is_admin
  end
end

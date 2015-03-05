class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user and user.is_admin
        scope.all
      else
        scope.where('published = true OR user_id = ?', (user && user.id || 0))
      end
    end
  end

  def create?
    user and (user.is_admin || record.blog.user == user)
  end

  def show?
    user and (user.is_admin || record.published || record.user == user)
  end

  def update?
    user and (user.is_admin || record.user == user)
  end
end

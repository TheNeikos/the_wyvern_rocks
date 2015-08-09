class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if valid_and_admin user
        scope.all
      else
        scope.where('published = true OR user_id = ?', (user && user.id || 0))
      end
    end
  end

  def create?
    user && (user.is_admin || record.blog.user == user)
  end

  def show?
    user && (user.is_admin || record.user == user) || true
  end

  def update?
    user && (user.is_admin || record.user == user)
  end
end

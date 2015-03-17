class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if member and member.is_admin
        scope.all
      else
        scope.where('published = true OR member_id = ?', (member && member.id || 0))
      end
    end
  end

  def create?
    member && (member.is_admin || record.blog.member == member)
  end

  def show?
    member && (member.is_admin || record.member == member) || true
  end

  def update?
    member && (member.is_admin || record.member == member)
  end
end

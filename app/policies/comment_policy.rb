class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? || user.moderator? || record.user_id != user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end

  def edit?
    user.admin? || record.user_id == user.id
  end
end

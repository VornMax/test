class ArticlePolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      elsif  user.moderator?
        scope.where(status: "draft")
      elsif user.member?
        scope.where(status: "draft", user_id: user).or(scope.where(status: "published"))
      end
    end

    private

    attr_reader :user, :scope
  end

  def create?
    user.member? || user.admin?
  end
 
  def update?
    user.admin? || user.moderator? && record.status == "draft" || user.member? && record.user_id == user.id && record.status == "draft"
  end
 
  def destroy?
    user.admin? || user.member? && record.user_id == user.id && record.status == "draft"
  end

  def edit?
    destroy?
  end

  def new?
    user.admin? || user.member?
  end

  def show?
    user.admin? || user.moderator? || user.member? && record.status == "published" || user.member? && record.user_id == user.id && record.status == "draft"
  end

  def admin?
    user.admin?
  end

  def show_draft?
    user.admin? && record.status == "draft" || user.moderator? && record.status == "draft" || user.member? && record.status == "draft"
  end
end
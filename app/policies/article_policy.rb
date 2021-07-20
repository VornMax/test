class ArticlePolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.moderator?
        scope.all
      else
        scope.where(status: "draft", user_id: user).or(scope.where(status: "published"))
      end
    end

    private

    attr_reader :user, :scope
  end

  def index?
    true 
  end
 
  def create?
    user.member?
  end
 
  def update?
    user.moderator? || user.member? && record.user_id == user.id && record.status == "draft"
  end
 
  def destroy?
    user.moderator?
  end

  def edit?
    user.moderator? || user.member? && record.user_id == user.id && record.status == "draft"
  end

  def new?
    user.member?
  end

  def show?
    user.moderator? || user.member? && record.status == "published" || user.member? && record.user_id == user.id && record.status == "draft"
  end
end
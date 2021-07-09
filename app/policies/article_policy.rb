class ArticlePolicy < ApplicationPolicy

  def index?
    #byebug
    user.jack?
  end
 
  def create?
    user.jack?
  end
 
  def update?
    user.vasya?
  end
 
  def destroy?
    user.tanya?
  end

  def edit?
    user.bil?
  end

  def new?
    user.jack?
  end
end
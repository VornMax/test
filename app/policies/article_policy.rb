class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.maks?
  end
 
  def update?
    user.maks? && record.title.include?('has') 
  end
 
  def destroy?
    user.maks? && record.title.include?('has') 
  end

  def edit?
    user.vasya_pupkin? && record.body.include?('new')
  end

  def new?
    user.maks?
  end

  def show?
    user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end
end
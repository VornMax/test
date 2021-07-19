class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    true
    #user.maks?
  end
 
  def update?
    true
    #user.maks? && record.title.include?('has') 
  end
 
  def destroy?
    true
    #user.maks? && record.title.include?('has') 
  end

  def edit?
    true
    #user.vasya_pupkin? && record.body.include?('new')
  end

  def new?
    true
    #user.maks?
  end

  def show?
    true
    #user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end
end
class ArticlePolicy < ApplicationPolicy

  def index?
    
  end
 
  def create?
  end
 
  def update?
    user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end
 
  def destroy?
    user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end

  def edit?
    user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end

  def new?
  end

  def show?
    #byebug
    #user.vasya_pupkin? and record.title.include? "new"
    user.maks? && record.title.include?('has') || user.vasya_pupkin? && record.body.include?('new')
  end
end
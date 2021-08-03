class FilterArticles
  include Interactor

  def call
    result = default_scope

    result = result.filter_by_title params[:title] if params[:title].presence                              
    
    result = result.filter_by_user_email params[:user] if params[:user].presence

    result = result.filter_by_body params[:body] if params[:body].presence                          

    result = result.filter_by_status params[:status] if params[:status].presence                  

    context.result = result.paginate page: params[:page], per_page: 30
  end

  private

  def default_scope
    context.scope || Article.all
  end

  def params
    context.params || {}
  end
end

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :common_article_access, only: %i[create new]
  before_action :article_access, only: %i[show edit update destroy]

  def index
    #byebug
    @article_params = article_params
    @articles = policy_scope(FilterArticles.call(params: @article_params).result)
  end


  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #byebug
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.permit(:title, :body, :status, :user_id)
    end

    def article_access
      @article = Article.find(params[:id])
      authorize @article
    end

    def common_article_access
      authorize Article
    end
end


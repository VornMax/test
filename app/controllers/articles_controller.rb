class ArticlesController < ApplicationController
  before_action :authenticate_user!
  #before_action :access_action
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all

  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
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
      params.require(:article).permit(:title, :body)
    end

    def access_action
      authorize Article
    end

    def set_article
      @article = Article.find(params[:id])
    end
end


class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :common_article_access, only: %i[create new]
  before_action :article_access, only: %i[show edit update destroy]

  def index
    @articles = Article.all
    if params[:title].present?
      @title = params[:title]
      @articles = @articles.filter_by_title(@title)                                 
    end

    if params[:user].present?
      #byebug
      @user = params[:user]
      @articles = @articles.filter_by_user_email(@user)
    end

    if params[:body].present?
      @body = params[:body]
      @articles = @articles.filter_by_body(@body)                             
    end

    if params[:status].present?
      @status = params[:status]
      @articles = @articles.filter_by_status(@status)                            
    end

    @articles = policy_scope(@articles).paginate page: params[:page], per_page: 30
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
      params.require(:article).permit(:title, :body, :status, :user_id)
    end

    def article_access
      @article = Article.find(params[:id])
      authorize @article
    end

    def common_article_access
      authorize Article
    end
end


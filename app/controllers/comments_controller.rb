class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Created comment"
      redirect_to article_path(@comment.base_article)
    else
      flash[:notice] = "Comment does not create"
      redirect_to article_path(@comment.base_article)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@comment.base_article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    flash[:notice] = "Deleted Comment"
    redirect_to article_path(@comment.base_article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :commentable_type, :commentable_id)
  end
end
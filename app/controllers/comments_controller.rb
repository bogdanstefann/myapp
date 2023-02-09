class CommentsController < ApplicationController
  def index
    article = Article.find(params[:article_id])
    @comments = article.comments
  end

  def create 
    article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    article.comments << @comment
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

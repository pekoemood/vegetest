class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.create(user: current_user)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.likes.find_by(user: current_user)
    @like.destroy if @like
    redirect_to @article
  end
end

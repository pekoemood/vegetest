class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: :'コメントを投稿しました'
    else
      p @comment.errors.full_messages
      redirect_to @article, alert: :'コメントの投稿に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

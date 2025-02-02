class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else 
      render :new, status:  :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "記事の更新が成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "記事の削除に成功しました"
    else
      redirect_to articles_path, notice: "記事の削除に失敗しました"
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :image)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end

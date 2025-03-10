class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page])


    # per_page = 6
    # page = params[:page].to_i > 0 ? params[:page].to_i : 1
    # offset = (page -1) * per_page

    # @articles = Article.all.order(created_at: :desc).limit(per_page).offset(offset)
    # @total_pages = (Article.count.to_f / per_page).ceil
    # @current_page = page
  end

  def show
    
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '記事の作成に成功しました'
    else 
      flash.now[:alert] = '記事の作成に失敗しました'
      render :new, status:  :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '記事の更新に成功しました'
    else
      flash.now[:alert] = '記事の更新に失敗しました'
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

  def get_json
    @articles = Article.all
    render json: @articles
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :image)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end

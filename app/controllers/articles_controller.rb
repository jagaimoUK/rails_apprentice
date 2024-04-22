class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.includes(:tags).all
    # この書き方だと、最新のタグで塗りかられてしまう。
  end

  def show
    @tags = @article.tags_as_string
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.save_tags(tag_lists)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # 記事に紐付いたタグを、名前だけに絞る。その上、`,`で区切り結合する。
    @tags = @article.tags_as_string
  end

  def update
    if @article.update(article_params)
      @article.update_tags(tags)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: "削除が成功しました", status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :name, :body, :button, :follow_number)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end

class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
    
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to new_article_path
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def index
    @articles = Article.all
  end
  
  def destroy
    Article.find(params[:id]).destroy
    redirect_to article_path
  end

  def confirm
  end
  
  def bookmarks
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :favorite)
  end

end

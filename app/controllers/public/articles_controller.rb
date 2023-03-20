class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
    
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end
  
  def edit 
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end

  def index
    @articles = Article.all
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def confirm
  end
  
  # 検索機能
  def search
    # 入力された検索ワードがタイトル、本文にあるかチェック
    if params[:keyword].present?
      @article = Article.where('body LIKE ?', "%#{params[:keyword]}%").where('title LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
      # binding.pry
    else
      Article.none
    end
  end
  

  private
  def article_params
    params.require(:article).permit(:title, :body, :favorite)
  end

end

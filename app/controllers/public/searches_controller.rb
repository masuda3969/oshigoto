class Public::SearchesController < ApplicationController
   # 検索機能
  def search
    @range = params[:range]
    @keyword = params[:keyword]
    

    search = params[:search]
    keyword = params[:keyword]
  
    
    #検索する対象がユーザーだった場合、ユーザーモデルからキーワード探す
    if @range == "ユーザー"
      @users = User.where('account LIKE ?', "%#{params[:keyword]}%")
    #検索する対象が記事だった場合、記事モデルからキーワードを探す
    elsif @range == "布教"
      @articles = Article.where('body LIKE ?', "%#{params[:keyword]}%").where('title LIKE ?', "%#{params[:keyword]}%")
    else
      User.none
      Article.none
    end
    
    # 入力された検索ワードがタイトル、本文にあるかチェック
  #   if params[:keyword].present?
  #     @article = Article.where('body LIKE ?', "%#{params[:keyword]}%").where('title LIKE ?', "%#{params[:keyword]}%")
      
  #     # binding.pry
  #   else
  #     Article.none
  #   end
  end

end

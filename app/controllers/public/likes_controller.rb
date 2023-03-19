class Public::LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = current_user.like.new(article_id: @article.id)
    @like.save
    redirect_to article_path(@article.id)
  end

  def index
    @likes = current_user.like.all
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = current_user.like.find_by(article_id: @article.id)
    @like.destroy
    redirect_to article_path(@article.id)
  end
end

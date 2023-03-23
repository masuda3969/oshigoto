class Public::HomesController < ApplicationController
  def top
    @articles = Article.order(created_at: :desc).limit(4)
  end

  def about
  end
end

class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all
  end
  

end

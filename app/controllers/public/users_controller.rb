class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all
  end
  
  def unsubscribe
  end
  
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

end

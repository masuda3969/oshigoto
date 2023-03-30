class Admin::UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc).limit(15)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :account, :email, :is_deleted)
  end
  
end

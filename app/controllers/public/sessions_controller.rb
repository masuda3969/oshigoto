# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  
  protected
  
  def user_state
    @user = User.find_by(email: params[:user][:email])
    # return if ! @customer
    
    if @user.valid_password?(params[:user][:passwoed]) 
      @user.valid_password?(params[:user][:passwoed]) && User.is_deleted == true
      redirect_to new_user_registration_path
      flash[:notice] = "退会済みの為、再登録が必要です。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])

end

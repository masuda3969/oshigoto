class ApplicationController < ActionController::Base
  
  # トップページとアバウトページのみログイン状態に関わらず閲覧可能
  # その他のページはログイン必須
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_signed_in?
  
  #管理者権限
  before_action :authenticate_admin!, if: :admin_url
  
  def admin_url
    request.fullpath.include?("/admin")
  end



  # deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後、トップページへ
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
 



  protected
  # deviseカラムの許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted, :account, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted, :account, :image])
  end


end

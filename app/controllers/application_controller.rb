class ApplicationController < ActionController::Base
  # deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  # deviseカラムの許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted, :account, :image])
  end

end

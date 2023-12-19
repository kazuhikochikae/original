class ApplicationController < ActionController::Base
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # ユーザー登録時にnameのストロングパラメータを追加（サインアップ時にnameを入力する場合は追記）
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    # ユーザー編集時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :avatar, :message])
  end




end

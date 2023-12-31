class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.role == "user" && current_user.profile.present?
      profile_path(current_user.profile)
    elsif current_user.role == "vr_person" && current_user.vr_person.present?
      vr_person_path(current_user.vr_person)
    else
      # プロフィールが存在しない場合や他のケースに対するデフォルトのリダイレクト先を指定
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end





  protected
  def configure_permitted_parameters
    # ユーザー登録時にnameのストロングパラメータを追加（サインアップ時にnameを入力する場合は追記）
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    # ユーザー編集時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :avatar, :message])
  end




end

class ApplicationController < ActionController::Base

  # before_action :configure_permitted_parameters, if: :devise_controller?


  # protected
  # # 新規登録のデータ
  # 　def configure_permitted_parameters
  # 　  devise_parameter_sanitizer.permit(:sign_up,keys:[:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :phonenumber ] )
  # 　end
end

class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

  before_action :configure_permitted_parameters, if: :devise_controller?

  
  # ↓新規登録時にusersテーブルに送るパラメーター（会員情報を指定する。）
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birthday])
  end


  private


  def production?
    Rails.env.production?
  end


  #  環境変数に設定したパスワードを設定している
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end

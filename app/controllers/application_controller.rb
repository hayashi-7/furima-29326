class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_out_path_for(resource)
    "/"
   end
  protected

  def configure_permitted_parameters
    user_dates = [:nickname, :first_name, :second_name, :first_name_kana, :second_name_kana, :birthday ]
    devise_parameter_sanitizer.permit :sign_up, keys: user_dates
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

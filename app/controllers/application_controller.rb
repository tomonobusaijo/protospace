class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :member, :profile, :works, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :member, :profile, :works, :avatar])
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery(with: :exception)

  rescue_from(CanCan::AccessDenied) do |exception|
    redirect_to(root_path, alert: exception.message)
  end

  before_action(:configure_permitted_parameters, if: :devise_controller?)

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password, :remember_me])
  end
end

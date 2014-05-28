class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #check_authorization

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_path, :alert => exception.message)
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenticate
      redirect_to(sign_up_path, :alert => 'Not signed in') unless current_user
    end

    def already_signed_in
      redirect_to(root_path, :alert => 'Already signed in') if current_user
    end
end

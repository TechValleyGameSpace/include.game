class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # TODO: add more granularity to authorize, or outright remove this function
  def authorize_user
    unless current_user and !current_user.banned?
      redirect_to '/login'
    end
  end
  
  def authorize_admin
    unless current_user and current_user.admin?
      redirect_to '/login'
    end
  end
end

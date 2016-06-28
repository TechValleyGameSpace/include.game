class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :set_time_zone

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

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
  
  def set_time_zone
    # HACK: forcing the timezone to be based off of NY
    Time.use_zone('America/New_York') { yield }
    #if current_user
    #  Time.use_zone(current_user.time_zone) { yield }
    #else
    #  yield
    #end
  end
end

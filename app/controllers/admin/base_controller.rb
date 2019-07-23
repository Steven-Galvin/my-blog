class Admin::BaseController < ActionController::Base
  layout 'admin'
  before_action :require_admin
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_admin
    if !logged_in? || logged_in? && @current_user.username != "Steven"
      flash[:danger] = "You are not allowed"
      redirect_to root_path
    end
  end
end

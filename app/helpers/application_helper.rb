module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect_to new_session_path unless logged_in?
  end

  def user_is_admin?
    current_user.is_admin? if logged_in?
  end
end

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def confirm_logged_in_user
    return if logged_in?

    flash[:error] = 'Log-in is required to proceed!'
    redirect_to login_path
  end
end

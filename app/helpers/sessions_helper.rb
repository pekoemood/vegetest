module SessionsHelper

  def check_logined
    @current_user = User.find_by(id: session[:user_id])
    
    if @current_user.nil?
      reset_session
      flash[:referer] = request.fullpath
      redirect_to login_path, alert: 'ログインしてください'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end
  
end

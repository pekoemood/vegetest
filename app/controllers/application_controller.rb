class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :check_logined
  helper_method :current_user




  private
    def check_logined
      @current_user = User.find_by(id: session[:user_id])
      
      if @current_user.nil?
        reset_session
        flash[:referer] = request.fullpath
        redirect_to login_path, alert: 'ログインしてください'
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
end



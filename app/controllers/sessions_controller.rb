class SessionsController < ApplicationController
  skip_before_action :check_logined

  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])

    if user
      reset_session
      params[:remember_me] == '1' ? remember(user) : forget(user)

      log_in(user)
      redirect_to params[:referer] || root_path, notice: 'ログイン成功'      
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが無効です'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path, status: :see_other, notice: 'ログアウトしました'
  end
end

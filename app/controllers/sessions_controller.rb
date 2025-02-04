class SessionsController < ApplicationController
  skip_before_action :check_logined

  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])

    if user
      reset_session
      session[:user_id] = user.id
      
      redirect_to params[:referer] || root_path, notice: 'ログイン成功'      
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが無効です'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end
end

class UsersController < ApplicationController
  skip_before_action :check_logined
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'アカウントを作成しました'
    else
      flash.now[:alert] = 'アカウントの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :referer)
  end
end

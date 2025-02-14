class UsersController < ApplicationController
  skip_before_action :check_logined
  before_action :set_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in(@user)
      redirect_to root_path, notice: 'アカウントを作成しました'
    else
      flash.now[:alert] = 'アカウントの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to root_path, status: :see_other, notice: '登録情報の変更に成功しました！'
    else 
      render :edit, status: :unprocessable_entity, alert: '登録情報の変更に失敗しました！'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

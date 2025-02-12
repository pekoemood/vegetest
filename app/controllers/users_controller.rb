class UsersController < ApplicationController
  skip_before_action :check_logined
  before_action :user_set
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

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def user_set
    @user = User.find(params[:id])
  end
end

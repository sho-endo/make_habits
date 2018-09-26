class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザーを新規作成しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの作成に失敗しました"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
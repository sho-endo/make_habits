class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user, only: [:show]
  before_action :forbid_login_user, only: [:new, :create]
  
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
  
  def correct_user
    @user = User.find_by(id: params[:id])
    unless current_user.id == @user.id
      flash[:warning] = "権限がありません"
      redirect_to current_user
    end
  end
  
  def forbid_login_user
    if current_user
      flash[:warning] = "すでにログインしています"
      redirect_to current_user
    end
  end
end

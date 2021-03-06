class MakesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show]
  
  def new
    @make = current_user.makes.build
  end

  def create
    @make = current_user.makes.build(make_params)
    if @make.save
      redirect_to "/makes/#{@make.id}/1"
    else
      flash.now[:danger] = "内容を入力してください"
      render :new
    end
  end

  def show
    @make = Make.find(params[:id])
    @rules = @make.rules
  end
  
  private
  def make_params
    params.require(:make).permit(:title)
  end
  
  def correct_user
    make = Make.find_by(id: params[:id])
    user = make.user if make
    unless user && current_user.id == user.id
      flash[:warning] = "権限がありません"
      redirect_to current_user
    end
  end
end

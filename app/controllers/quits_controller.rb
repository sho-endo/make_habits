class QuitsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show]

  def new
    @quit = current_user.quits.build
  end

  def create
    @quit = current_user.quits.build(quit_params)
    if @quit.save
      redirect_to "/quits/#{@quit.id}/1"
    else
      flash.now[:danger] = "内容を入力してください"
      render :new
    end
  end

  def show
    @quit = Quit.find(params[:id])
    @rules = @quit.rules
  end
  
  private
  def quit_params
    params.require(:quit).permit(:title)
  end
  
  def correct_user
    quit = Quit.find_by(id: params[:id])
    user = quit.user if quit
    unless user && current_user.id == user.id
      flash[:warning] = "権限がありません"
      redirect_to current_user
    end
  end
end

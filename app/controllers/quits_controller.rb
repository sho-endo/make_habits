class QuitsController < ApplicationController
  before_action :require_user_logged_in

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
end

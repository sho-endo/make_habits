class MakesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @make = current_user.makes.build
  end

  def create
    @make = current_user.makes.build(make_params)
    if @make.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end
  
  private
  def make_params
    params.require(:make).permit(:title)
  end
end

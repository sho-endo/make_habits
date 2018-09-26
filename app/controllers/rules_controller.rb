class RulesController < ApplicationController
  before_action :require_user_logged_in
  before_action :get_make, only: [:make1, :make2, :make3, :make4, :make_create]
  
  def make1
  end
  
  def make2
    @rule = @make.rules.build
    @norm = params[:norm]
  end
  
  def make3
  end
  
  def make4
    @rule = @make.rules.build
    @situation = params[:situation]
  end
  
  def make_create
    
    @rule = @make.rules.build(rule_params)
    path = Rails.application.routes.recognize_path(request.referer)
    
    if path[:action] == "make2"
      if @rule.save
        flash[:info] = "１つ目の自分ルールを作成しました"
        redirect_to "/rules/#{@make.id}/3"
      else
        flash[:danger] = "保存に失敗しました"
        redirect_back "/rules/#{@make.id}/2"
      end
    else
      if @rule.save
        flash[:info] = "お疲れ様でした。自分ルールの完成です！！"
        redirect_to @make
      else
        flash[:danger] = "保存に失敗しました"
        redirect_back "/rules/#{@make.id}/4"
      end
    end
    
  end
  
  private
  def rule_params
    params.require(:rule).permit(:content)
  end
  
  def get_make
    @make = Make.find(params[:make_id])
  end
end

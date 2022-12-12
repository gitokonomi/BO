class Admin::RecruitingsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.all
  end
  
  def show
    @recruiting = Recruiting.find(params[:id])
    @recruiting_comment = RecruitingComment.new
  end
  
  def edit
    @recruiting = Recruiting.find(params[:id])
  end
  
  def update
    @recruiting = Recruiting.find(params[:id])
    if @recruiting.update(user_params)
      redirect_to root_path, notice: "変更を保存しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    @recruiting = Recruiting.find(params[:id])
    @recruiting.destroy
    redirect_to admin_recruiting_path(@recruiting), notice: "削除しました。"
  end

end

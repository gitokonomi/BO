class Admin::RecruitingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.page(params[:page]).per(12)
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
    if @recruiting.update(recruiting_params)
      redirect_to admin_recruiting_path(@recruiting), notice: "変更を保存しました。"
    else
      render "edit"
    end
  end

  def destroy
    @recruiting = Recruiting.find(params[:id])
    @recruiting.destroy
    redirect_to admin_recruitings_path, notice: "募集を削除しました。"
  end




  private

  def recruiting_params
    params.require(:recruiting).permit(:title, :body, :prefecture_id, :place, :date, :deadline, :is_matched)
  end

end

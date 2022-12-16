class Public::RecruitingsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show,:edit]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
  end

  def create
    @recruiting = Recruiting.new(recruiting_params)
    @recruiting.user_id = current_user.id
    if @recruiting.save
      redirect_to recruitings_path, notice: "募集しました！"
    else
      @recruitings = Recruiting.all
      render 'index'
    end
  end

  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.all
  end

  def show
    @recruiting = Recruiting.find(params[:id])
    @recruiting_comment = RecruitingComment.new
  end

  def edit
  end

  def update
    if @recruiting.update(recruiting_params)
      redirect_to recruiting_path(@recruiting), notice: "編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @recruiting.destroy
    redirect_to recruitings_path
  end



  private

  def recruiting_params
    params.require(:recruiting).permit(:title, :body, :prefecture_id, :place, :date, :deadline, :is_matched)
  end

  def ensure_correct_user
    @recruiting = Recruiting.find(params[:id])
    unless @recruiting.user == current_user
      redirect_to root_path, notice: "投稿した本人しか編集できません。"
    end
  end

end

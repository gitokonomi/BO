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
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end



  private

  def recruiting_params
    params.require(:recruiting).permit(:title, :body, :prefecture_id, :place, :date, :deadline)
  end

  def ensure_correct_user
    @recruiting = Recruiting.find(params[:id])
    unless @recruiting.user == current_user
      redirect_to root_path
    end
  end

end

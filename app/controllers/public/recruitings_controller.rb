class Public::RecruitingsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show,:edit]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
  end
  
  def create
  end
  
  def index
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
    params.require(:recruiting).permit(:title,:date,:place,:deadline,:body)
  end

  def ensure_correct_user
    @recruiting = Recruiting.find(params[:id])
    unless @recruiting.user == current_user
      redirect_to root_path
    end
  end

end

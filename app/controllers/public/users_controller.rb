class Public::UsersController < ApplicationController
  before_action :authenticate_user!  
  
  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])    
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update
  end


  
private
  def user_params
    params.require(:user).permit(:name,:email,:introduction)
  end
  
end

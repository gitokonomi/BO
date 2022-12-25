class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @areas = @user.areas.all
    @user_recruitings = @user.recruitings
  end

  def edit
    @user = User.find(params[:id])
    @prefectures = Prefecture.all
    @area = Area
    @areas = @user.areas
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "変更を保存しました。"
    else
      flash[:alert] = "保存できませんでした"
      render "edit"
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :is_deleted)
  end
end

class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @areas = @user.areas.all
    @user_recruitings = @user.recruitings
  end

  def edit
    @prefectures = Prefecture.all
    @area = Area
    @areas = @user.areas.all
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "変更を保存しました。"
    else
      render "edit"
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:recruiting_id)
    @favorite_recruitings = Recruiting.find(favorites)
  end



private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集はできません。'
    end
  end

end

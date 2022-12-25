class Admin::AreasController < ApplicationController
  
  def create
    # @user = User.find(params[:id])
    @area = @user.areas.new(area_params)
    # 既に登録済みのエリアを選んだ場合の挙動
    if @user.areas.find_by(prefecture_id: params[:area][:prefecture_id]).present?
      redirect_to admin_edit_user_path(@user), alert: "既に追加済みです。"
    elsif @area.save
      @areas = @user.areas.all
      redirect_to admin_edit_user_path(@user), notice: "追加しました。"
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @area = Area.find(params[:id])
    @area.destroy
    redirect_to admin_edit_user_path(@user)
  end





private

  def area_params
    params.require(:area).permit(:prefecture_id)
  end

end

class Public::AreasController < ApplicationController
  before_action :authenticate_user!

  def create
    @area = current_user.areas.new(area_params)
    # 既に登録済みのエリアを選んだ場合の挙動
    if current_user.areas.find_by(prefecture_id: params[:area][:prefecture_id]).present?
      redirect_to edit_user_path(current_user), alert: "既に追加済みです。"
    elsif @area.save
      @areas = current_user.areas.all
      redirect_to edit_user_path(current_user), notice: "追加しました。"
    else
      redirect_to root_path
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    redirect_to edit_user_path(current_user)
  end





private

  def area_params
    params.require(:area).permit(:prefecture_id)
  end

end

class Admin::AreasController < ApplicationController
  
  def create
    @area = Area.new(area_params)
    user = @area.user
    # 既に登録済みのエリアを選んだ場合の挙動
    if Area.find_by(prefecture_id: @area.prefecture_id, user_id: @area.user_id).present?
      redirect_to edit_admin_user_path(user), alert: "既に追加済みです。"
    elsif @area.save
      @areas = @area.user.areas.all
      redirect_to edit_admin_user_path(user), notice: "追加しました。"
    else
      redirect_to root_path
    end
  end

  def destroy
    @area = Area.find(params[:id])
    user = @area.user
    @area.destroy
    redirect_to edit_admin_user_path(user), notice: "削除しました。"
  end





private

  def area_params
    params.require(:area).permit(:prefecture_id, :user_id)
  end

end

class Admin::PrefecturesController < ApplicationController
  before_action :authenticate_admin!

  def create
    @prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to admin_prefectures_path
    else
      @prefectures = Prefecture.all
      render :index
    end
  end

  def index
    @prefectures = Prefecture.all
    @prefecture = Prefecture.new
  end

  def edit
    @prefecture = Prefecture.find(params[:id])
  end

  def update
    @prefecture = Prefecture.find(params[:id])
    if @prefecture.update(prefecture_params)
      redirect_to admin_prefectures_path, notice: "編集に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @prefecture = Prefecture.find(params[:id])
    @prefecture.destroy
    redirect_to admin_prefectures_path
  end



  private

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end

end

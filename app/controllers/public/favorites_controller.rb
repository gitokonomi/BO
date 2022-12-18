class Public::FavoritesController < ApplicationController
  def create
    recruiting = Recruiting.find(params[:recruiting_id])
    @favorite = current_user.favorites.new(recruiting_id: recruiting.id)
    @favorite.save
    recruiting.create_notification_favorite!(current_user)
    render 'replace_btn'
  end
  
  def destroy
    recruiting = Recruiting.find(params[:recruiting_id])
    @favorite = current_user.favorites.find_by(recruiting_id: recruiting.id)
    @favorite.destroy
    render 'replace_btn'
  end
  
end

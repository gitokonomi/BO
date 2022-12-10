class Public::FavoritesController < ApplicationController
  def create
    recruiting = Recruiting.find(params[:recruiting_id])
    @favorite = current_user.favorites.new(recruiting_id: recruiting.id)
    @favorite.save
    redirect_to recruiting_path(recruiting)
  end
  
  def destroy
    recruiting = Recruiting.find(params[:recruiting_id])
    favorite = current_user.favorites.find_by(recruiting_id: recruiting.id)
    favorite.destroy
    redirect_to recruiting_path(recruiting)
  end
  
end

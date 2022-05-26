class FavoritesController < ApplicationController
  
  def create
    @favorite=Favorite.new
    @favorite.user_id=current_user.id
    @favorite.book_id=params[:book_num]
    @favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @favorite=current_user.favorites.find_by(book_id: params[:book_num])
    @favorite.destroy
    redirect_to request.referer
  end
  
  private
  
  def favorite_params
    params.require(:favorite).permmit(:good)
  end
  
end

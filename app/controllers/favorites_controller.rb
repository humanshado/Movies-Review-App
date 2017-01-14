class FavoritesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.favorites.create!(user: current_user)
    flash[:notice] =  "#{current_user.name}, Thanks!"
    redirect_to(@movie)
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    @movie = Movie.find(params[:movie_id])
    flash[:notice] =  "Sorry that '#{@movie.title}' did not meet your expectations"
    redirect_to(@movie)

  end

end

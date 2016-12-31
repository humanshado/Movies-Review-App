class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      flash[:notice] = "Movie updated successfully!"
      redirect_to(@movie)
    else
      render('edit')
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie created successfully!"
      redirect_to(@movie)
    else
      render('new')
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted successfully!"
    redirect_to(@movie)
  end



  private
    def movie_params
      params.require(:movie).permit(:title, :description, :released_on, :category, :duration, :rating, :total_gross, :cast)
    end

end

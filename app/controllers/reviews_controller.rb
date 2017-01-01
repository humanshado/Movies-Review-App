class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Thanks for your review"
      redirect_to movie_path(@movie)
    end
  end

private

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end

end

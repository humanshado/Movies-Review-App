class ReviewsController < ApplicationController
  before_action :require_signin, except: [:index, :show]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Thanks for your review"
      redirect_to movie_path(@movie)
    end
  end

private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end

end

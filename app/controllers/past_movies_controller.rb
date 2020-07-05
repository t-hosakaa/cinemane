class PastMoviesController < ApplicationController
  def index
    @past_movies = PastMovie.all
  end

  def new
    @past_movie = PastMovie.new
  end

  def create
    past_movie = PastMovie.new(past_movie_params)
    if past_movie.save
      redirect_to past_movies_path
    else
      render new_past_movie_path
    end

  end

  private

  def past_movie_params
    params.require(:past_movie).permit(:title, :genre, :review, :image, :url)
  end
end

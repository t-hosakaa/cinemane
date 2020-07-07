class PastMoviesController < ApplicationController
  before_action :set_past_movie, only: [:edit, :show]
  
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

  def show
  end

  def edit
  end

  def update
    past_movie = PastMovie.find(params[:id])
    if past_movie.update(past_movie_params)
      redirect_to past_movies_path
    else
      render edit_past_movie_path(past_movie.id)
    end

  end

  def destroy
    past_movie = PastMovie.find(params[:id])
    past_movie.destroy
    redirect_to past_movies_path
  end

  def search
    @past_movies = PastMovie.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_past_movie
    @past_movie = PastMovie.find(params[:id])
  end

  def past_movie_params
    params.require(:past_movie).permit(:title, :genre, :review, :image, :url)
  end
end

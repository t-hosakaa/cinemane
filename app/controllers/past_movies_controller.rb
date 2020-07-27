class PastMoviesController < ApplicationController
  before_action :set_past_movie, only: [:edit, :show]

  def top
  end
  
  def index
    @past_movies = PastMovie.where(user_id: current_user.id)
  end

  def new
    @past_movie = PastMovie.new
  end

  def create
    @past_movie = PastMovie.new(past_movie_params)
    if @past_movie.save
      flash[:notice] = "#{@past_movie.title}を登録しました"
      redirect_to past_movies_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    @past_movie = PastMovie.find(params[:id])
    if @past_movie.update(past_movie_params)
      flash[:notice] = "『#{@past_movie.title}』を更新しました"
      redirect_to root_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end

  end

  def destroy
    past_movie = PastMovie.find(params[:id])
    past_movie.destroy
    flash[:notice] = "『#{past_movie.title}』を削除しました"
    redirect_to past_movies_path
  end

  def search
    current_movies = PastMovie.where(user_id: current_user.id)
    @past_movies = current_movies.search(params[:keyword])
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
    params.require(:past_movie).permit(:title, :genre, :review, :image, :url).merge(user_id: current_user.id)
  end
end

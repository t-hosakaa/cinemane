class PastMoviesController < ApplicationController
  before_action :set_past_movie, only: [:edit, :show]
  before_action :move_to_top, only:[:index]

  def top
  end
  
  def index
    @past_movies = PastMovie.where(user_id: current_user.id)
  end

  def new
    @past_movie = PastMovie.new
  end

  def create
    past_movie = PastMovie.new(past_movie_params)
    if past_movie.save
      flash[:notice] = "映画を登録しました"
      redirect_to past_movies_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render new_past_movie_path
    end

  end

  def show
  end

  def edit
  end

  def update
    @past_movie = PastMovie.find(params[:id])
    if @past_movie.update(past_movie_params)
      flash[:notice] = "映画情報を更新しました"
      redirect_to root_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end

  end

  def destroy
    past_movie = PastMovie.find(params[:id])
    past_movie.destroy
    flash[:notice] = "映画を削除しました"
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

  def move_to_top
    redirect_to top_past_movies_path, method: :get unless user_signed_in?
  end

  def set_past_movie
    @past_movie = PastMovie.find(params[:id])
  end

  def past_movie_params
    params.require(:past_movie).permit(:title, :genre, :review, :image, :url).merge(user_id: current_user.id)
  end
end

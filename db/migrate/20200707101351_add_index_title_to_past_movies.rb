class AddIndexTitleToPastMovies < ActiveRecord::Migration[6.0]
  def change
    add_index :past_movies, :title
  end
end

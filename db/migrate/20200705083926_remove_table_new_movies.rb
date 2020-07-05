class RemoveTableNewMovies < ActiveRecord::Migration[6.0]
  def change
    drop_table :new_movies
  end
end

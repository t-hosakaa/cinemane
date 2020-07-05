class RemoveTablePastMoviesHashtags < ActiveRecord::Migration[6.0]
  def change
    drop_table :past_movies_hashtags
  end
end

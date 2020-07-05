class CreatePastMoviesHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :past_movies_hashtags do |t|
      # t.references :past_movie_id, index: true, foreign_key: true
      # t.references :hashtag_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end

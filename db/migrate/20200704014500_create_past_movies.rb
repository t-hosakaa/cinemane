class CreatePastMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :past_movies do |t|
      t.string :title
      t.string :genre
      t.text :review
      t.text :image
      t.text :url
      t.timestamps
    end
  end
end

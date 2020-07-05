class CreateNewMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :new_movies do |t|
      t.string :title
      t.string :genre
      t.text :review
      t.text :image
      t.text :url
      t.timestamps
    end
  end
end

class CreateGroupPastMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :group_past_movies do |t|
      t.references :group, foreign_key: true
      t.references :past_movie, foreign_key: true
      t.timestamps
    end
  end
end

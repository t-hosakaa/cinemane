class AddUserIdToPastMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :past_movies, :user_id, :integer
  end
end

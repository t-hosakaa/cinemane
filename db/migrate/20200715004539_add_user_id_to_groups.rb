class AddUserIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :user_id, :integer, foreign_key: true
  end
end

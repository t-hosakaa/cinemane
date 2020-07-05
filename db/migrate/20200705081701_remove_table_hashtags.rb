class RemoveTableHashtags < ActiveRecord::Migration[6.0]
  def change
    drop_table :hashtags
  end
end

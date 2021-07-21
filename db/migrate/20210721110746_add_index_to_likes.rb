class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, %i[user_id post_id], unique: true
  end
end

class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :user_id, :follower_id
    rename_column :friendships, :friend_id, :followee_id
  end
end

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :followee_id
      t.integer :follower_id
    end
  end
end

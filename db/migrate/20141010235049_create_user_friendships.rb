class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end

    add_index :user_friendships, :user_id
    add_index :user_friendships, :friend_id
    add_index :user_friendships, [:user_id, :friend_id], unique: true
    add_index :user_friendships, [:friend_id, :user_id], unique: true
  end
end

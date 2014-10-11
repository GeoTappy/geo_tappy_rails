class UserFriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.friends_for(user)
    where(user_id: user.id).includes(:friend).map(&:friend)
  end

  def self.create_if_new(user, friend)
    return if user.id == friend.id
    return if where(user_id: user.id, friend_id: friend.id).exists?
    return if where(friend_id: user.id, user_id: friend.id).exists?

    new(user_id: user.id,   friend_id: friend.id).save
    new(user_id: friend.id, friend_id: user.id).save
  end

  def self.remove_connections(user)
    sql = 'user_id = :user_id OR friend_id = :user_id'

    where(sql, user_id: user.id).destroy_all
  end
end

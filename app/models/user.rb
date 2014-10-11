class User < ActiveRecord::Base
  has_many :auth_providers

  has_many :user_friendships, dependent: :delete_all
  has_many :friends, through: :user_friendships

  # TODO: Demo mode, user has only one device now
  has_one :mobile_device, dependent: :delete

  has_many :shares
  has_many :user_shares
  has_many :shared_locations, through: :user_shares

  has_many :locations

  def self.by_email(email)
    return if email.blank?

    where(email: email).first
  end

  def find_friend(id)
    friendship = user_friendships.includes(:friend)
      .where(friend_id: id)
      .first

    raise ActiveRecord::RecordNotFound if friendship.nil?

    friendship.friend
  end

  def update_push_token(token)
    if mobile_device.present?
      mobile_device.update_attributes(address: token)
    else
      create_mobile_device(address: token)
    end
  end
end

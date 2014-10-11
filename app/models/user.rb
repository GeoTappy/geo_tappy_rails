class User < ActiveRecord::Base
  has_many :auth_providers

  has_many :user_friendships, dependent: :delete_all
  has_many :friends, through: :user_friendships

  def self.by_email(email)
    return if email.blank?

    where(email: email).first
  end
end

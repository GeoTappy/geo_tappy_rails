class User < ActiveRecord::Base
  has_many :auth_providers

  def self.by_email(email)
    return if email.blank?

    where(email: email).first
  end
end

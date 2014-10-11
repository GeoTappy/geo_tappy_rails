class Share < ActiveRecord::Base
  belongs_to :user

  has_one :location

  has_many :user_shares

  def title
    read_attribute(:title).presence || "#{user.first_name} share a location with you"
  end

  def send_push_notifications
    SharePushNotification.new(self).notify
  end
end

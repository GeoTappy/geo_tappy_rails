class Share < ActiveRecord::Base
  belongs_to :user

  has_one :location

  has_many :user_shares

  def title
    read_attribute(:title).presence || I18n.t('current_location',
                                              name: user.first_name,
                                              location: location.place_name
                                             )
  end

  def send_push_notifications
    SharePushNotification.new(self).notify
  end
end

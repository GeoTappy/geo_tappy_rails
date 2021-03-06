class SharePushNotification
  attr_accessor :share

  def initialize(share)
    self.share = share
  end

  def notify
    PushNotification.new(device_tokens).notify(share.notification_message, {
      info: {
        sender: {
          name: [share.user.first_name, share.user.last_name].compact.join(' '),
          profile_photo_url: share.user.profile_photo_url
        },
        location: {
          lat: share.location.lat,
          lng: share.location.lng,
          name: share.location.place_name
        }
      }
    })
  end

  def device_tokens
    @device_tokens ||= MobileDevice.select(:address)
      .where(user_id: share.user_shares.map(&:user_id))
      .map(&:address).compact
  end
end

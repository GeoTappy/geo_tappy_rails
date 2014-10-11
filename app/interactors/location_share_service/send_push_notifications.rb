class LocationShareService
  class SendPushNotifications
    include Interactor

    def call
      context.user_shares.to_a.select(&:persisted?).each do |user_share|
        user_share.send_push_notification
      end
    end
  end
end

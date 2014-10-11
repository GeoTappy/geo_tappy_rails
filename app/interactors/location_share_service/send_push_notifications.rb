class LocationShareService
  class SendPushNotifications < BaseInteractor
    def call
      share.send_push_notifications
    end
  end
end

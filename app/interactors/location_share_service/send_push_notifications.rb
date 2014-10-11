class LocationShareService
  class SendPushNotifications
    include Interactor

    def call
      context.share.send_push_notifications
    end
  end
end

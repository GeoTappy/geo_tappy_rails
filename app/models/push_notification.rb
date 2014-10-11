class PushNotification
  def initialize(device_tokens)
    self.device_tokens = device_tokens
  end

  def notify(message, options = {})
    notification = default_options.merge(
      push_options(message, options)
    )

    if device_tokens.empty?
      Rails.logger.warn "No device_tokens found, skipping push"
      return
    end

    Celluloid::Future.new do
      Rails.logger.info "Sending push notification: #{notification.inspect}"
      ZeroPush.notify(notification).tap {|push| Rails.logger.debug push.inspect }
    end
  end

  private

  attr_accessor :device_tokens

  def push_options(message, options)
    options.merge(
      device_tokens: device_tokens,
      alert:         message
    )
  end

  def default_options
    {
      sound: "default",
      badge: 1
    }
  end
end

class PushNotification
  def initialize(device_tokens)
    self.device_tokens = device_tokens
  end

  def notify(message, options)
    notification = default_options.merge(options).merge(alert: message)

    ZeroPush.notify(notification)
  end

  private

  def push_options(options)
    options.merge(
      device_tokens: device_tokens
    )
  end

  def default_options
    {
      sound: "default",
      badge: 1
    }
  end
end

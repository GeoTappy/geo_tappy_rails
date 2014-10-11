class PushNotification
  def initialize(device_tokens)
    self.device_tokens = device_tokens
  end

  def notify(message, options = {})
    notification = default_options.merge(
      push_options(message, options)
    )

    ZeroPush.notify(notification)
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

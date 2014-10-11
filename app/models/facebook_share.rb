class FacebookShare
  attr_accessor :user

  def initalize(current_user)
    self.user = current_user
  end

  def post(options = {})
    lat = options.fetch(:lat)
    lng = options.fetch(:lng)

    graph = FetchStrategy::Facebook.new(token).graph

    place = graph.search('', type: 'place', center: "#{lat},#{lng}", distance: 1000)[0]

    graph.put_connections('me', 'feed',
      message: "I am now at #{place['name']}!",
      place: place['id']
    )
  rescue => e
    Rails.logger.error "Could not post to Facebook: #{e.message}"
    Rails.logger.debug e.backtrace.join("\n")
  end

  private

  def token
    @token ||= facebook_provider && facebook_provider.token
  end

  def facebook_provider
    @facebook_provider ||= user.auth_providers.where(provider: 'facebook').first
  end
end

module FetchStrategy
  def self.from_params(params)
    provider = params.fetch(:provider)
    token    = params.fetch(:token)

    "FetchStrategy::#{provider.classify}".constantize.new(token)
  end
end

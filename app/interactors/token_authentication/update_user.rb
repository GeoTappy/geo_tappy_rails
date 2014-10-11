class TokenAuthentication
  class UpdateUser
    include Interactor

    def call
      user.assign_attributes(fetcher.user_attributes)
      user.access_token = SecureRandom.hex(16)
      user.auth_providers << auth_provider unless user.auth_providers.include?(auth_provider)
      user.save
    end

    private

    def fetcher
      context.fetcher
    end

    def user
      context.user
    end

    def auth_provider
      context.auth_provider
    end
  end
end

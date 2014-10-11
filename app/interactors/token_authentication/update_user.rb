class TokenAuthentication
  class UpdateUser
    include Interactor

    def call
      user.assign_attributes(fetcher.user_attributes)
      user.access_token = SecureRandom.hex(16)
      user.save
    end

    private

    def fetcher
      context.fetcher
    end

    def user
      context.user
    end
  end
end

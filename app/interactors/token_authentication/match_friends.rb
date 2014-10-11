class TokenAuthentication
  class MatchFriends
    include Interactor

    def call
      FriendMatcher.new(user, provider: provider).match(friends)
    end

    private

    def provider
      context.provider
    end

    def user
      context.user
    end

    def friends
      context.fetcher.friends
    end
  end
end

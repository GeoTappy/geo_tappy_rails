class LocationShareService
  class CreateUserShares
    include Interactor

    def call
      context.friends       = friends
      context.user_shares = friends.map do |user|
        context.share.user_shares.new(user_id: user.id)
      end
      context.user_shares.each(&:save)
    end

    private

    def friends
      UserFriendship.friends_for(context.current_user)
    end
  end
end

class RecentSharedLocations
  class FriendShare < Struct.new(:friend, :location)
  end

  attr_accessor :current_user, :shares

  def initialize(current_user)
    self.current_user = current_user
  end

  def fetch
    fetched_friends = []

    self.shares = user_shares.each_with_object([]) do |user_share, shares|
      share    = user_share.share
      location = share.location
      friend   = share.user

      unless fetched_friends.include?(friend)
        shares << FriendShare.new(friend, location)
        fetched_friends << friend
      end
    end

    self
  end

  private

  def user_shares
    @user_shares ||= UserShare.includes(share: [:location, :user])
      .where(user_id: current_user.id)
  end

  def friends
    @friends ||= current_user.friends
  end
end

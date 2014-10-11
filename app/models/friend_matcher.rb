class FriendMatcher
  class Friend
    include ActiveAttr::Attributes
    include ActiveAttr::MassAssignment

    attribute :id
    attribute :name
  end

  attr_accessor :user, :provider

  def initialize(user, opts = {})
    self.user     = user
    self.provider = opts[:provider].to_s
  end

  def match(friends)
    friends.map do |f|
      friend = AuthProvider.where(
        provider: provider,
        provider_account_id: Friend.new(f).id
      ).first

      return if friend.nil?

      UserFriendship.create_if_new(user, friend)
    end
  end
end

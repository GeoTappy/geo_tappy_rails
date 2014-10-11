class LocationShareService
  class CreateUserShares
    include Interactor

    def call
      context.users       = users
      context.user_shares = context.users.map do |user|
        context.share.user_shares.new(user_id: user.id)
      end
      context.user_shares.each(&:save)
    end

    private

    def users
      User.where(id: context.user_ids.map(&:to_i))
    end
  end
end

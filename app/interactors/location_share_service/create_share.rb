class LocationShareService
  class CreateShare < BaseInteractor
    def call
      context.share = current_user.shares.create(title: context.title)
    end

    def rollback
      share.destroy
    end
  end
end

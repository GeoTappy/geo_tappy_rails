class LocationShareService
  class CreateShare
    include Interactor

    def call
      context.share = current_user.shares.create(title: context.title)
    end

    def rollback
      context.share.destroy
    end

    private

    def current_user
      context.current_user
    end
  end
end

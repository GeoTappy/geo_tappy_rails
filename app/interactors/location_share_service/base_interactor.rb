class LocationShareService
  class BaseInteractor
    include Interactor

    private

    def current_user
      context.current_user
    end

    def location
      context.new_location
    end

    def share
      context.share
    end
  end
end

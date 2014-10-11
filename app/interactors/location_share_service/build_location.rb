class LocationShareService
  class BuildLocation
    include Interactor

    def call
      context.new_location = context.share.build_location(location_params)
    end

    private

    def location_params
      context.location.merge(user_id: current_user.id)
    end

    def current_user
      context.current_user
    end
  end
end

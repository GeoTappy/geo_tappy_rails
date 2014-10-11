class LocationShareService
  class CreateLocation
    include Interactor

    def call
      context.location = context.share.create_location(location_params)
    end

    private

    def location_params
      context.location
    end
  end
end

class LocationShareService
  class GeocodeLocation
    include Interactor

    def call
      location.address = Geocoder::search(location.coordinates)[0].try(:address)
    end

    private

    def location
      context.new_location
    end
  end
end

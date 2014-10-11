class LocationShareService
  class GeocodeLocation < BaseInteractor
    def call
      location.address = Geocoder::search(location.coordinates)[0].try(:address)
    end
  end
end

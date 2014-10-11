class LocationShareService
  class FindPlaceForLocation < BaseInteractor
    def call
      place = places_client.spots(
        location.lat, location.lng, types: Location::GOOGLE_TYPES, rankby: 'distance'
      ).first

      if place.present?
        location.place_id   = place.place_id
        location.place_name = place.name
        location.photo_url  = place.photos.first && place.photos.first.fetch_url(800)
      end
    rescue => e
      Rails.logger.error e.message
      Rails.logger.debug e.backtrace.join("\n")

      context.fail!(error: e.message)
    end

    private

    def places_client
      @places_client ||= GooglePlaces::Client.new(Settings.google.api_key)
    end
  end
end

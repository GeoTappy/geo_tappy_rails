class LocationShareService
  include Interactor::Organizer

  organize CreateShare, CreateLocation, GeocodeLocation, FindPlaceForLocation,
    SaveLocation, CreateUserShares, SendPushNotifications
end

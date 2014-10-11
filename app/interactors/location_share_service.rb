class LocationShareService
  include Interactor::Organizer

  organize CreateShare, BuildLocation, GeocodeLocation, FindPlaceForLocation,
    SaveLocation, CreateUserShares, SendPushNotifications
end

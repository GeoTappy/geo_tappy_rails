class RecentSharedLocationsSerializer < ActiveModel::Serializer
  attributes :locations

  def locations
    object.shares.map do |share|
      {
        lat: share.location.lat,
        lng: share.location.lng,
        name: share.location.place_name,
        photo_url: share.location.photo_url,
        user: {
          id: share.friend.id,
          name: [share.friend.first_name, share.friend.last_name].compact.join(' '),
          profile_photo_url: share.friend.profile_photo_url
        }
      }
    end
  end
end

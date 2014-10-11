class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :photo_url, :place_name, :lat, :lng, :created_at
end


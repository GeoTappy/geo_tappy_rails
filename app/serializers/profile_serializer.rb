class ProfileSerializer < UserSerializer
  attributes :access_token, :friends, :cover_photo_url

  has_many :friends, serializer: UserSerializer
end

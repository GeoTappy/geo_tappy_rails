class ProfileSerializer < UserSerializer
  attributes :access_token, :friends

  has_many :friends, serializer: UserSerializer
end

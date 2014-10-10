class UserSerializer < ActiveModel::Serializer
  attributes :access_token, :id, :email, :name, :friends

  def friends
    []
  end

  def name
    [object.first_name, object.last_name].compact.join(' ')
  end
end

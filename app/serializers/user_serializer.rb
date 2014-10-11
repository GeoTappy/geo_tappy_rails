class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :profile_picture

  private

  def name
    [object.first_name, object.last_name].compact.join(' ')
  end
end

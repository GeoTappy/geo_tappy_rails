class TokenAuthentication
  include ActiveModel::Model
  include Interactor::Organizer

  organize FetchData, SetupAuthProvider, SetupUser, UpdateUser
end

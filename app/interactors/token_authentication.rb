class TokenAuthentication
  include Interactor::Organizer

  organize FetchData, SetupAuthProvider, SetupUser, UpdateUser, MatchFriends
end

class TokenAuthentication
  class SetupAuthProvider
    include Interactor

    def call
      provider = AuthProvider.includes(:user).where(
        provider: context.provider, provider_account_id: context.account_id
      ).first_or_initialize.tap do |t|
        t.token = context.token
      end
      provider.save

      context.auth_provider = provider
    end
  end
end

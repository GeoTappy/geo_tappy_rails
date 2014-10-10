class TokenAuthentication
  class SetupUser
    include Interactor

    def call
      if user.present?
        context.user = user
      elsif user_by_email.present?
        context.user = user_by_email
      else
        context.user = User.new
      end
    end

    private

    def user
      @user ||= context.auth_provider.user
    end

    def user_by_email
      @user_by_email ||= User.by_email(context.fetcher.email)
    end
  end
end

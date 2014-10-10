module Api
  module V1
    class TokensController < BaseController
      MissingProvider = Class.new(StandardError)
      MissingToken    = Class.new(StandardError)

      rescue_from MissingToken do
        render json: { error: 'wrong_token' }
      end

      rescue_from MissingProvider do
        render json: { error: 'provider_not_specified' }
      end

      rescue_from ActionController::ParameterMissing do
        render json: { error: 'empty_or_missing_auth' }
      end

      def create
        raise MissingToken    if auth_params[:token].blank?
        raise MissingProvider if auth_params[:provider].blank?

        auth = TokenAuthentication.call(auth_params)

        render json: auth.user, serializer: UserSerializer
      end

      def auth_params
        params.require(:auth).permit(:token, :provider)
      end
    end
  end
end

module Api
  module V1
    class BaseController < ApplicationController
      Unauthorized = Class.new(StandardError)

      protect_from_forgery with: :null_session

      respond_to :json

      rescue_from Unauthorized do
        render json: { error: 'unauthorized' }
      end

      private

      def current_user
        @current_user ||= User.where(access_token: params[:access_token]).first
      end

      def require_user
        raise Unauthorized if current_user.blank?
      end
    end
  end
end


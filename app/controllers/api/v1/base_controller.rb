module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session

      respond_to :json

      private

      def current_user
        @current_user ||= User.where(access_token: params[:access_token]).first
      end
    end
  end
end


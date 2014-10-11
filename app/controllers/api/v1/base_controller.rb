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
        @current_user ||= User.where(access_token: params[:access_token]).first.tap do |u|
          Rails.logger.info "### User: #{u.id} #{u.first_name} #{u.last_name}"
        end
      end

      def require_user
        raise Unauthorized if params[:access_token].blank? || current_user.blank?
      end
    end
  end
end


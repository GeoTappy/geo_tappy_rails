module Api
  module V1
    class LocationsController < BaseController
      before_filter :require_user

      def index
        respond_with user.locations
      end

      private

      def user
        return @user if defined?(@user)

        @user = if params[:user_id].present?
                  current_user.find_friend(params[:user_id])
                else
                  current_user
                end
      end

      def location_params
        params.require(:location).permit(:lat, :lng)
      end
    end
  end
end

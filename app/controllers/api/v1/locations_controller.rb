module Api
  module V1
    class LocationsController
      def index
        respond_with user.locations
      end

      private

      def user
        return @user if defined?(@user)

        @user = if params[:user_id].present?
                  User.find(params[:user_id])
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

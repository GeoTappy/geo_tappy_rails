module Api
  module V1
    class ProfilesController < BaseController
      before_filter :require_user

      def show
        render json: current_user, serializer: ProfileSerializer
      end
    end
  end
end

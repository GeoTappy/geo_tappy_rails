module Api
  module V1
    class ProfileController
      def show
        render json: current_user.to_json, serializer: ProfileSerializer
      end
    end
  end
end

module Api
  module V1
    class LocationsController < BaseController
      before_filter :require_user

      def index
        locations = RecentSharedLocations.new(current_user).fetch

        respond_with locations, serializer: RecentSharedLocationsSerializer, root: false
      end
    end
  end
end

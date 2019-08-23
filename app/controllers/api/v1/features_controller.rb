module Api
  module V1
    class FeaturesController < ApplicationController
      Feature.generate_scopes

      include JSON_Response

      def index
        @features = Feature.all.order(name: :asc)
        json_response(@features)
      end

      def show
        @feature = Feature.find(params[:id])
        json_response(@feature)
      end

      def ranger_stations
        @features = Feature.type_ranger_station
        json_response(@features)
      end

    end
  end
end

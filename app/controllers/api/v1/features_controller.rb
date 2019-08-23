module Api
  module V1
    class FeaturesController < ApplicationController
      Feature.generate_scopes
      # This is great and works surprisingly well
      # all scopes are generated dynamically with this class method

      include JSON_Response

      def index
        @features = Feature.all.order(name: :asc)
        json_response(@features)
      end

      def show
        @feature = Feature.find(params[:id])
        json_response(@feature)
      end

      def random
        @feature = Feature.random
        json_response(@feature)
      end

      def ranger_stations
        @features = Feature.type_ranger_station
        json_response(@features)
      end

      def campgrounds
        @features = Feature.type_campground
        json_response(@features)
      end

      def lodges
        @features = Feature.type_lodge
        json_response(@features)
      end

      def fishing
        @features = Feature.type_fishing
        json_response(@features)
      end

      def cave_entrance
        @features = Feature.type_cave_entrance
        json_response(@features)
      end

      def type
        if Feature.respond_to?("type_#{params[:path]}")
          @features = Feature.public_send("type_#{params[:path]}")
          json_response(@features)
        else
          json_response({:message => "Sorry! Feature type not found"})
        end
      end

    end
  end
end

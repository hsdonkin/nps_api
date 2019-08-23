module Api
  module V1
    class FeaturesController < ApplicationController
      Feature.generate_scopes

      include JSON_Response

      def index
        @features = Feature.all
        json_response(@features)
      end

      def show
      end
    end
  end
end

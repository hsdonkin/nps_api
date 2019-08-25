require 'rails_helper'

describe Api::V1::FeaturesController, :type => :controller do

  describe "GET #index" do

    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected feature attributes" do
      json_response = JSON.parse(response.body).first
      test_feature = FactoryHugh.build(:feature)
      attrs = test_feature.attributes.each do |attr|
        if json_response[attr[0]] == nil
          break false
        end
      end
      expect(attrs).not_to eq(false)
    end

  end
end

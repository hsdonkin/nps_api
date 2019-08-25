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

  # can't convince my rescue tests to run, ideas?

  # describe 'GET #show' do
  #   before do
  #     get :show
  #     params[:id] = "20000"
  #   end
  #
  #   it 'will rescue from record not found' do
  #     response.status.should eql(404)
  #     error = {"error": "Couldn't find Feature with 'id'=2000000"}
  #     response.body.should eq (error.to_json)
  #   end
  # end

end

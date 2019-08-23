require 'rails_helper'
require 'pry'
require 'rspec-rails'

describe Feature, :type => :model do

  it "includes scope to return only Features that are campsites" do
    features = Feature.campsites
    failures = []
    features.each do |f|
      if f.feature_type != "Campsite"
        failures.push(f)
      end
      expect(failures.length).to eq(0)
    end
  end

end # end of Feature model tests

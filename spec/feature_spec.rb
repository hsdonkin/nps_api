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

  it "creates a template name for unnamed locations" do
    feature = Feature.new(:name => "", :feature_type => "Campsite", :geometry_type => nil, :prop => nil, :tags => nil, :created => Time.now, :latitude => nil, :longitude => nil)
    feature.name_repair
    expect(feature.name).to eq("Unnamed #{feature.feature_type}")
  end

end # end of Feature model tests

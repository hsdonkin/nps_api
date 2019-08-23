require 'rails_helper'
require 'pry'
require 'rspec-rails'

describe Feature, :type => :model do

  # Test is now outdated, since we're dynamically generating scopes
  # Name mismatched but functionality still in place

  # it "includes scope to return only Features that are campsites" do
  #   features = Feature.campsites
  #   failures = []
  #   features.each do |f|
  #     if f.feature_type != "Campsite"
  #       failures.push(f)
  #     end
  #     expect(failures.length).to eq(0)
  #   end
  # end

  it "creates a template name for unnamed locations" do
    feature = Feature.new(:name => "", :feature_type => "Campsite", :geometry_type => nil, :prop => nil, :tags => nil, :created => Time.now, :latitude => nil, :longitude => nil)
    feature.name_repair
    expect(feature.name).to eq("Unnamed #{feature.feature_type}")
  end

  it "does not give a template name to named locations" do
    feature = FactoryHugh.build(:feature)
    original_name = feature.name
    feature.name_repair
    expect(feature.name).to eq(original_name)
  end

  it 'automagically creates a bunch of scopes based on feature types' do
    scopes = Feature.generate_scopes
    methods = Feature.methods
    failed_include = false
    scopes.each do |s|
      if methods.include? s == false
        failed_include = true
      end
    end
    expect(failed_include).to eq(false)
  end

end # end of Feature model tests
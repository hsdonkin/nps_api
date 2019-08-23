require 'pry'
require 'rake'

desc 'process geojson to database'
  task :process => :environment do
    Rake::Task["db:drop"]
    Rake::Task["db:create"]
    file = File.open("points_of_interest.geojson")
    hash = JSON.parse(file.read)
    hash["features"].length.times do |i|
      puts i
      feature = Feature.new(
        :name => hash["features"][i]["properties"]["name"].to_s,
        # interesting error where :type is reserved by sql for class inheritance
        # renaming column to "feature_type"
        :feature_type => hash["features"][i]["properties"]["type"].to_s,
        :geometry_type => hash["features"][i]["geometry"]["type"].to_s,
        :latitude => hash["features"][i]["geometry"]["coordinates"][1],
        :longitude => hash["features"][i]["geometry"]["coordinates"][0],
        :tags => hash["features"][i]["properties"]["tags"].to_s,
        :prop => hash["features"][i]["properties"].to_s,
        :created => hash["features"][i]["properties"]["created"]
      )
      feature.save
    end
  end

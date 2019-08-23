require 'pry'
require 'rake'

desc 'process geojson to database'
  task :process => :environment do
    file = File.open("points_of_interest.geojson")
    hash = JSON.parse(file.read)
    binding.pry
  end

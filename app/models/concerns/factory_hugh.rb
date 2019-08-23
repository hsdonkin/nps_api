class FactoryHugh

  def self.build(object)
    if object == :unnamed_feature
      Feature.new(:name => "", :feature_type => "Campsite", :geometry_type => nil, :tags => nil, :created => Time.now, :latitude => nil, :longitude => nil)
    end
    if object == :feature
      Feature.new(:name => "Wagon Wheel Pass", :feature_type => "Campsite", :geometry_type => "Point", :tags => "{}" , :created => Time.now, :latitude => 0.35635369e2, :longitude => -0.83872126e2)
    end
  end

end

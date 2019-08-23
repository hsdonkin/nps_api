class Feature < ApplicationRecord

  after_initialize :name_repair
  attr_accessor :name

  # scope :campsites, -> {where("feature_type='Campsite'")}

  # automagically generates scopes for each feature type
  # converts the string type into a symbol and creates a scope from it
  def self.generate_scopes
    types = Feature.types
    scopes = []
    types.each do |t|

      # have to explicitly state that feature_type is a new string object
      feature_type = String.new(t)
      if t != "" #some types are blank oops
        # prettying the scopes a little bit
        t.gsub!(" ", "_")
        t.gsub!("-", "_")
        t.gsub!("/", "_")
        t.squeeze!("_")

        scope ("type_#{t.downcase}").to_sym, -> {where("feature_type='#{feature_type}'")}
        puts "Created scope: type_#{t.downcase.delete(" ")}"
        scopes.push("type_#{t.downcase}".to_sym)
      end
    end

    return scopes

  end


  def name_repair
    if self.name == "" || self.name == nil
      if self.feature_type != ""
        self.name = "Unnamed #{self.feature_type}"
      else
        self.name = "Unnamed #{self.geometry_type}"
      end
    end
  end

  def tags_to_hash
    tags = self.tags
    tags.gsub!(":", "_").delete!("\"").gsub!(",", "=>")
    array = tags.split("=>")
    array.each {|item| item.strip!}
    hash = array.each_slice(2).to_h
    self.tags = hash
    binding.pry
  end

  # def prop_repair
  #   binding.pry
  #   self.prop = self.prop.delete("\\")
  #   self.prop = self.prop.gsub('\\"', '')
  # end

  def self.types
    features = Feature.all
    output = []
    features.each do |f|
      if output.include?(f.feature_type) == false
        output.push(f.feature_type)
      end
    end
    output
  end



end

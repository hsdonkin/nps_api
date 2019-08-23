class Feature < ApplicationRecord
  attr_accessor :name

  scope :campsites, -> {where("feature_type='Campsite'")}

  def name_repair
    if self.name == "" || self.name == nil
      self.name = "Unnamed #{self.feature_type}"
    end
  end

end

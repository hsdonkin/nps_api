class Feature < ApplicationRecord

  scope :campsites, -> {where("feature_type='Campsite'")}
  
end

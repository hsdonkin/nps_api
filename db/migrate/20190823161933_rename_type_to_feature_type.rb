class RenameTypeToFeatureType < ActiveRecord::Migration[5.2]
  def change
    rename_column :features, :type, :feature_type
  end
end

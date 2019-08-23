class RemoveUrlFromFeatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :features, :url
  end
end

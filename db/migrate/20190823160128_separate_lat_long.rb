class SeparateLatLong < ActiveRecord::Migration[5.2]
  def change
    remove_column :features, :coordinates
    # thanks stack overflow for this format for lat long
    add_column :features, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :features, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end

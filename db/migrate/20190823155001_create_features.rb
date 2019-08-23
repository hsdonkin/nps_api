class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.string :type
      t.string :geometry_type
      t.string :coordinates
      t.string :prop
      t.string :tags
      t.datetime :created
    end
  end
end

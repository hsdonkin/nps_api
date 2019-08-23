class RemoveProp < ActiveRecord::Migration[5.2]
  def change
    remove_column :features, :prop
  end
end

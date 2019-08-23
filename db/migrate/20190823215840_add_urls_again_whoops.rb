class AddUrlsAgainWhoops < ActiveRecord::Migration[5.2]
  def change
    change_table :features do |t|
      t.string :url
    end
  end
end

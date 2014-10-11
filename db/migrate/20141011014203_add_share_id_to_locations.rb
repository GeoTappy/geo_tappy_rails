class AddShareIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :share_id, :integer
    add_index :locations, :share_id
  end
end

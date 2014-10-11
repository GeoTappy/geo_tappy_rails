class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lng, precision: 9, scale: 6
      t.string :address
      t.string :place_id, index: true
      t.string :place_name
      t.string :photo_url


      t.timestamps
    end
  end
end

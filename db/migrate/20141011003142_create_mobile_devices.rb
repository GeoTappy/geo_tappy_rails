class CreateMobileDevices < ActiveRecord::Migration
  def change
    create_table :mobile_devices do |t|
      t.string :address
      t.references :user, index: true

      t.timestamps
    end
    add_index :mobile_devices, :address
  end
end

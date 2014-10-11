class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :title
      t.references :user, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end

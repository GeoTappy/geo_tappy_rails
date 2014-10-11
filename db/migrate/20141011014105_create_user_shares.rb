class CreateUserShares < ActiveRecord::Migration
  def change
    create_table :user_shares do |t|
      t.references :user, index: true
      t.references :share, index: true

      t.timestamps
    end
  end
end

class CreateAuthProvider < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.string :provider
      t.string :provider_account_id
      t.references :user, index: true
      t.string :token

      t.timestamps
    end
    add_index :auth_providers, :provider
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.date :birthdate

      t.timestamps
    end
  end
end

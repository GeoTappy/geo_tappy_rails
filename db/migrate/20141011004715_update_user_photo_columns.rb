class UpdateUserPhotoColumns < ActiveRecord::Migration
  def change
    rename_column :users, :profile_picture, :profile_photo_url
    add_column :users, :cover_photo_url, :string
  end
end

class ChangeTokenColumnTypeToText < ActiveRecord::Migration
  def change
    change_column :auth_providers, :token, :text
  end
end

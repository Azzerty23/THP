class AddPrivacyToGossip < ActiveRecord::Migration[5.2]
  def change
    add_column :gossips, :privacy, :boolean, default: 0
  end
end

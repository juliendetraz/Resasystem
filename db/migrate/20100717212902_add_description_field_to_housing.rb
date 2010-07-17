class AddDescriptionFieldToHousing < ActiveRecord::Migration
  def self.up
    add_column :housings, :description, :text
  end

  def self.down
    remove_column :housings, :description
  end
end

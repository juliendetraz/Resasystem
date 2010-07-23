class RemoveHousingsIdFromHousing < ActiveRecord::Migration
  def self.up
    remove_column :housings, :housings_id
  end

  def self.down
    add_column :housings, :housings_id, :integer
  end
end

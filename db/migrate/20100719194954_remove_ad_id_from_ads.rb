class RemoveAdIdFromAds < ActiveRecord::Migration
  def self.up
    remove_column :ads, :ad_id
  end

  def self.down
    add_column :ads, :ad_id, :integer
  end
end

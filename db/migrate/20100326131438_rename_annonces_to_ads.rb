class RenameAnnoncesToAds < ActiveRecord::Migration
  def self.up
    rename_table :annonces, :ads
    rename_column :ads, :hebergement_id, :housing_id
    add_column :ads, :ad_id, :integer
  end

  def self.down
    rename_column :ads, :housing_id, :hebergement_id
    remove_column :ads, :ad_id, :integer
    rename_table :ads, :annonces
  end
end



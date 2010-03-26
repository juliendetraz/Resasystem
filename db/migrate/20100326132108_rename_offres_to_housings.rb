class RenameOffresToHousings < ActiveRecord::Migration
  def self.up
    rename_table :offres, :housings
    remove_column :housings, :hebergement_id
    remove_column :housings, :gmap_latitude
    remove_column :housings, :gmap_longitude
    remove_column :housings, :is_visible
    add_column :housings, :housings_id, :integer
    add_column :housings, :has_elevator, :boolean
    add_column :housings, :floor, :integer
    add_column :housings, :capacity, :integer
    add_column :housings, :is_visible, :boolean
  end

  def self.down
    add_column :housings, :hebergement_id, :integer
    add_column :housings, :gmap_latitude, :string
    add_column :housings, :gmap_longitude, :string
    remove_column :housings, :is_visible
    add_column :housings, :is_visible, :string
    remove_column :housings, :housings_id
    remove_column :housings, :has_elevator
    remove_column :housings, :floor
    remove_column :housings, :capacity
    change_column :housings, :is_visible, :string
    rename_table :housings, :offres
  end
end

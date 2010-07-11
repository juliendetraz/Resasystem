class RenameKitchenType < ActiveRecord::Migration
  def self.up
    rename_column :kitchens, :type, :kitchen_type
    add_column :housings, :state, :string
  end

  def self.down
    rename_column :kitchens, :kitchen_type, :type
    remove_column :housings, :state, :string
  end
end

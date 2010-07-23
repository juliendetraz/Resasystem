class RenameTypeColumnBecauseIsMagicColumn < ActiveRecord::Migration
  def self.up
    rename_column :housings, :type, :housing_type
    rename_column :rooms, :type, :room_type
    rename_column :services, :type, :service_type
  end

  def self.down
    rename_column :services, :service_type, :type
    rename_column :rooms, :room_type, :type
    rename_column :housings, :housing_type, :type
  end
end

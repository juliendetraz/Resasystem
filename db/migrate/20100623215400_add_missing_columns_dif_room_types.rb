class AddMissingColumnsDifRoomTypes < ActiveRecord::Migration
  def self.up
    add_column :bedrooms, :name, :string
    add_column :kitchens, :kitchen_type, :string
    add_column :dinningrooms, :sofa_bed_option, :string
  end

  def self.down
    remove_column :dinningrooms, :sofa_bed_option
    remove_column :kitchens, :kitchen_type
    remove_column :bedrooms, :name
  end
end

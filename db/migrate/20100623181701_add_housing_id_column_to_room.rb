class AddHousingIdColumnToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :housing_id, :integer
  end

  def self.down
    remove_column :rooms, :housing_id, :integer
  end
end

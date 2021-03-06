class CreateHousingPois < ActiveRecord::Migration
  def self.up
    create_table :housing_pois do |t|
      t.integer :housing_poi_id
      t.integer :housing_id
      t.string :name
      t.decimal :distance, :precision => 5, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_pois
  end
end

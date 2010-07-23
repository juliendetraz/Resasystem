class AddHousingsPicturesTable < ActiveRecord::Migration
  def self.up
    create_table :housings_pictures, :id => false do |t|
      t.integer :housing_id
      t.integer :picture_id
    end
  end

  def self.down
    drop_table :housings_pictures
  end
end

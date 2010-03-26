class CreateHousingPictures < ActiveRecord::Migration
  def self.up
    create_table :housing_pictures do |t|
      t.integer :housing_id
      t.integer :picture_id

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_pictures
  end
end

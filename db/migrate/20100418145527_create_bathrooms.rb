class CreateBathrooms < ActiveRecord::Migration
  def self.up
    create_table :bathrooms do |t|
      t.integer :room_id
      t.boolean :has_bath
      t.boolean :has_toilets
      t.boolean :has_shower

      t.timestamps
    end
  end

  def self.down
    drop_table :bathrooms
  end
end

class CreateBedrooms < ActiveRecord::Migration
  def self.up
    create_table :bedrooms do |t|
      t.integer :room_id
      t.integer :beds_simple_quantity
      t.integer :beds_double_quantity
      t.integer :beds_bunk_quantity
      t.integer :beds_cott_quantity
      t.boolean :has_shared_bathroom
      t.boolean :has_shared_toilets
      t.varchar :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bedrooms
  end
end

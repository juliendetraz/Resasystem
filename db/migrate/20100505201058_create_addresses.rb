class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :complement
      t.string :zip
      t.string :state_province_country
      t.string :other_address_details
      t.string :city
      t.string :country
      t.decimal :gmap_latitude, :precision => 10, :scale => 7
      t.decimal :gmap_longitude, :precision => 10, :scale => 7

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end

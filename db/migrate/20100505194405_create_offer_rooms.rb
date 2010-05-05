class CreateOfferRooms < ActiveRecord::Migration
  def self.up
    create_table :offer_rooms do |t|
      t.integer :room_id
      t.integer :offer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offer_rooms
  end
end

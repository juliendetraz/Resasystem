class AddPicturesRoomsTable < ActiveRecord::Migration
  def self.up
    create_table :pictures_rooms, :id => false do |t|
      t.integer :picture_id
      t.integer :room_id
    end
  end

  def self.down
    drop_table :pictures_rooms
  end
end

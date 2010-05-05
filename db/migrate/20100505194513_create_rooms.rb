class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :type
      t.intger :surface_area

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end

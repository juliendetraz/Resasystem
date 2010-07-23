class CreateLivingrooms < ActiveRecord::Migration
  def self.up
    create_table :livingrooms do |t|
      t.integer :room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :livingrooms
  end
end

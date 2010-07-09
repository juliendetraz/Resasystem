class CreateKitchens < ActiveRecord::Migration
  def self.up
    create_table :kitchens do |t|
      t.integer :room_id
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :kitchens
  end
end

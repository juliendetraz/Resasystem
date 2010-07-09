class CreateDinningrooms < ActiveRecord::Migration
  def self.up
    create_table :dinningrooms do |t|
      t.integer :room_id
      t.string :sofa_bed_option

      t.timestamps
    end
  end

  def self.down
    drop_table :dinningrooms
  end
end

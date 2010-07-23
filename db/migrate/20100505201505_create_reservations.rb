class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :customer_id
      t.integer :calendar_id
      t.string :reservation_status
      t.datetime :reservation_date

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end

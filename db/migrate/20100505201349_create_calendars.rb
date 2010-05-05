class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.string :offer_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :availability_type

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end

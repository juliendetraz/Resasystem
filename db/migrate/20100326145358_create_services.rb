class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :service_id
      t.string :service
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end

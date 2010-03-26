class CreateHousingServices < ActiveRecord::Migration
  def self.up
    create_table :housing_services do |t|
      t.integer :housing_id
      t.integer :service_id
      t.decimal(5,2) :price

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_services
  end
end

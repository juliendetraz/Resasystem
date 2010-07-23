class CreateHousingServices < ActiveRecord::Migration
  def self.up
    create_table :housing_services do |t|
      t.integer :housing_id
      t.integer :service_id
      t.decimal :price, :precision => 5, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_services
  end
end

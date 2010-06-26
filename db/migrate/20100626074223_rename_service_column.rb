class RenameServiceColumn < ActiveRecord::Migration
  def self.up
    rename_column :services, :service, :name
    add_column :services, :slug, :string
    remove_column :services, :service_id
    drop_table :housing_services
    create_table :housings_services, :id => false do |t|
      t.integer :housing_id
      t.integer :service_id
    end
  end

  def self.down
    drop_table :housings_services
    create_table :housing_services do |t|
      t.integer :housing_id
      t.integer :service_id
      t.decimal :price, :precision => 5, :scale => 2

      t.timestamps
    end
    add_column :services, :service_id, :integer
    remove_column :services, :slug
    rename_column :services, :name, :service
  end
end

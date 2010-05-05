class CreateHousingUser < ActiveRecord::Migration
  def self.up
    create_table :housing_user do |t|
      t.integer :user_id
      t.integer :housing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_user
  end
end
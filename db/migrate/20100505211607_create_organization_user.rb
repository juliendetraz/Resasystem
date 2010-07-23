class CreateOrganizationUser < ActiveRecord::Migration
  def self.up
    create_table :organization_user do |t|
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end

  def self.down
    drop_table :organization_user
  end
end
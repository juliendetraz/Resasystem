class RenameOrganizationUserTable < ActiveRecord::Migration
  def self.up
    rename_table :organization_user, :organizations_users
  end

  def self.down
    rename_table :organizations_users, :organization_user
  end
end

class RemovePathAndUrlFieldsFromPictures < ActiveRecord::Migration
  def self.up
    remove_column :pictures, :url
    remove_column :pictures, :path
  end

  def self.down
    add_column :pictures, :path, :string
    add_column :pictures, :url, :string
  end
end

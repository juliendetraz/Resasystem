class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :url
      t.string :path
      t.string :order
      t.boolean :is_default
      t.boolean :is_visible
      t.boolean :is_validated
      t.datetime :date_validated

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end

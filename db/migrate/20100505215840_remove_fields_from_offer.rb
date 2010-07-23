class RemoveFieldsFromOffer < ActiveRecord::Migration
  def self.up
    remove_column :offers, :price_id
    remove_column :offers, :calendar_id
  end

  def self.down
    add_column :offers, :calendar_id, :string
    add_column :offers, :price_id, :string
  end
end

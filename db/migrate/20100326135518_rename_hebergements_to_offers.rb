class RenameHebergementsToOffers < ActiveRecord::Migration
  def self.up
    rename_table :hebergements, :offers
    rename_column :offers, :hebergement_id, :offers_id
    rename_column :offers, :offre_id, :housing_id
    add_column :offers, :price_id, :string
    add_column :offers, :calendar_id, :int
  end

  def self.down
    rename_column :offers, :offers_id, :hebergement_id
    rename_column :offers, :housing_id, :offre_id
    remove_column :offers, :price_id
    remove_column :offers, :calendar_id
    rename_table :offers, :hebergements
  end
end

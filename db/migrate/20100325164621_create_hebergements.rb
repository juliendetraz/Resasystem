class CreateHebergements < ActiveRecord::Migration
  def self.up
    create_table :hebergements do |t|
      t.integer :hebergement_id
      t.integer :offre_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hebergements
  end
end

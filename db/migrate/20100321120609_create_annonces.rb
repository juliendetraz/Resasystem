class CreateAnnonces < ActiveRecord::Migration
  def self.up
    create_table :annonces do |t|
      t.string :reference
      t.string :title
      t.text :description
      t.boolean :is_validated
      t.integer :hebergement_id

      t.timestamps
    end
  end

  def self.down
    drop_table :annonces
  end
end

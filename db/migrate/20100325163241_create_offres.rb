class CreateOffres < ActiveRecord::Migration
  def self.up
    create_table :offres do |t|
      t.integer :hebergement_id
      t.integer :address_id
      t.integer :user_id
      t.string :phone_contact
      t.string :email
      t.string :website
      t.string :name
      t.string :is_visible
      t.string :type
      t.string :url_alias
      t.string :distance_commerce
      t.string :distance_train
      t.string :distance_transport
      t.string :gmap_latitude
      t.string :gmap_longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :offres
  end
end

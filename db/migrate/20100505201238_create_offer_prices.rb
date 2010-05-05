class CreateOfferPrices < ActiveRecord::Migration
  def self.up
    create_table :offer_prices do |t|
      t.integer :offer_id
      t.decimal :price, :precision => 5, :scale => 2
      t.string :season

      t.timestamps
    end
  end

  def self.down
    drop_table :offer_prices
  end
end

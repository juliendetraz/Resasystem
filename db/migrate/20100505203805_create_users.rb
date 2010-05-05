class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :phone_contact
      t.string :phone_fax
      t.string :phone_mobile
      t.string :phone_pro
      t.string :phone_home
      t.string :role
      t.boolean :is_active
      t.string :language
      t.boolean :has_subscribed
      t.string :firstday_week

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

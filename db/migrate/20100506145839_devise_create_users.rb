class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable
      
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

    add_index :users, :email,                :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end

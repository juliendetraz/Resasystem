class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.integer :message_usergroup_id
      t.integer :parent_message
      t.string :subject
      t.text :body
      t.boolean :is_sent
      t.boolean :is_new

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end

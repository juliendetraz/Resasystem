class CreateMessageUsergroups < ActiveRecord::Migration
  def self.up
    create_table :message_usergroups do |t|
      t.string :group

      t.timestamps
    end
  end

  def self.down
    drop_table :message_usergroups
  end
end

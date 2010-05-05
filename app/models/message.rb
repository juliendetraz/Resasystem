class Message < ActiveRecord::Base
  has_one :message

  belongs_to :users
  belongs_to :messages
  belongs_to :message_usergroup
end

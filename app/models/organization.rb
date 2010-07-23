class Organization < ActiveRecord::Base
  # FIXME Primary key is not allowed in a has_and_belongs_to_many join table (organizations_users)
  #has_and_belongs_to_many :users
end

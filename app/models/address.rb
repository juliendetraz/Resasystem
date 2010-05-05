class Address < ActiveRecord::Base
  has_many :users
  has_many :housings
end

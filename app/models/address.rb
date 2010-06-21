class Address < ActiveRecord::Base
  has_many :users
  has_many :housings
  
  accepts_nested_attributes_for :housings, :allow_destroy => true
end

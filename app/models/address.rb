class Address < ActiveRecord::Base
  has_many :users
  has_many :housings

  validates :street, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
end

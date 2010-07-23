class Address < ActiveRecord::Base
  has_many :cusers
  has_many :musers
  has_many :housings

  validates :street, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
end

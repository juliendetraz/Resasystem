class Offer < ActiveRecord::Base
  has_many :calendar
  has_many :offer_price
  
  belongs_to :housing
  
  has_and_belongs_to_many :rooms
end

class Room < ActiveRecord::Base
  has_many :kitchens
  has_many :bedrooms
  has_many :bathrooms
  has_many :livingrooms
  has_many :dinningrooms

  belongs_to :housing
  
#  has_and_belongs_to_many :offers
#  has_and_belongs_to_many :pictures
end

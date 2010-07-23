class Room < ActiveRecord::Base
  has_many :kitchens, :dependent => :destroy
  has_many :bedrooms, :dependent => :destroy
  has_many :bathrooms, :dependent => :destroy
  has_many :livingrooms, :dependent => :destroy
  has_many :dinningrooms, :dependent => :destroy

  belongs_to :housing
  
#  has_and_belongs_to_many :offers
#  has_and_belongs_to_many :pictures
end

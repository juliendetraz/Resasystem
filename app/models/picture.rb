class Picture < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :housing
end

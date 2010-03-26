class HousingService < ActiveRecord::Base
  has_many :housing
  has_many :service
end

class HousingService < ActiveRecord::Base
  belongs_to :housing
  belongs_to :service
end

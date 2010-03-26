class Service < ActiveRecord::Base
  belongs_to :housing_service
  belongs_to :housing_poi
end

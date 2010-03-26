class Housing < ActiveRecord::Base
  belongs_to :offer
  belongs_to :housing_service
  belongs_to :ad
end

class Housing < ActiveRecord::Base
  belongs_to :offer
  has_many :ad
end

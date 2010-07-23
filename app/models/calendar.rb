class Calendar < ActiveRecord::Base
  has_many :reservation
  
  belongs_to :offer
end

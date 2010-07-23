class Kitchen < ActiveRecord::Base
  belongs_to :room
  
  validates_presence_of :kitchen_type
end

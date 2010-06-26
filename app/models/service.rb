class Service < ActiveRecord::Base
  has_and_belongs_to_many :housings
  
  validates_presence_of :name
  validates_presence_of :slug
  validates_presence_of :service_type
end

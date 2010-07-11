class Picture < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :housing

  has_attached_file :picture, :storage => :database
end

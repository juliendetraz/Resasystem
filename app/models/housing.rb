class Housing < ActiveRecord::Base
  has_many :ads
  has_many :offers
  has_many :housing_pois
  has_many :housing_services
  
  belongs_to :user
  belongs_to :address
  
  has_and_belongs_to_many :pictures
  #TODO cette relation n'a pas ete testee il est possible qu'elle ne
  #fonctionne pas car il y a une double relation entre User et Housing
  has_and_belongs_to_many :users, :class_name => "Favorites"
  
  accepts_nested_attributes_for :address, :allow_destroy => true
end

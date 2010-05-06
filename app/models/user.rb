class User < ActiveRecord::Base
  has_many :housings
  has_many :messages

  belongs_to :address

  has_and_belongs_to_many :organizations
  #TODO cette relation n'a pas ete testee il est possible qu'elle ne
  #fonctionne pas car il y a une double relation entre User et Housing
  has_and_belongs_to_many :housings, :class_name => "Favorites"
  
  def full_name
    "#{first_name} #{last_name}"
  end
end

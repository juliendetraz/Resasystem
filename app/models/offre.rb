class Offre < ActiveRecord::Base
  belongs_to :hebergement
  has_many :annonce
end

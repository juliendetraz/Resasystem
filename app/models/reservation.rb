class Reservation < ActiveRecord::Base
  belongs_to :calendar
end

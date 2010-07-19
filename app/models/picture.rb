class Picture < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :housing

<<<<<<< HEAD
  has_attached_file :picture
=======
  has_attached_file :picture,
                    :styles => {
                      :thumb => ['380x278>', :jpg],
                      :tsquare => ['100x81#', :jpg],
                      :large => ['800x600>', :jpg]
                    },
                    :default_style => :thumb,
                    :default_url => '/images/blank.gif',
                    :convert_options => {:thumb => '-strip -background white -flatten', :large => '-strip -background white -flatten'},
                    :path => ':rails_root/public/assets/pictures/:id/:style.:extension',
                    :url => '/assets/pictures/:id/:style.:extension'
>>>>>>> 4f05b8c872403e4906067858f78a52732209f2de
end

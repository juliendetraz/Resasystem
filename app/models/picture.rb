class Picture < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :housing

  has_attached_file :picture,
                    :styles => {
                      :thumb => ['380x278>', :jpg],
                      :tsquare => ['100x81#', :jpg],
                      :large => ['800x600>', :jpg]
                    },
                    :default_style => :thumb,
                    :default_url => '/images/no_image.gif',
                    :url => '/assets/pictures/:id/:style.:extension',
                    :path => ':rails_root/public/assets/pictures/:id/:style.:extension',
                    :convert_options => {:thumb => '-strip -background white -flatten', :large => '-strip -background white -flatten'}
end

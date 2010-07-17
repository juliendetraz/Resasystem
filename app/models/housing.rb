class Housing < ActiveRecord::Base
  has_many :ads
  has_many :rooms
  has_many :offers
  has_many :housing_pois
  
  belongs_to :user
  belongs_to :address
  
  has_and_belongs_to_many :pictures
  has_and_belongs_to_many :services
  #TODO cette relation n'a pas ete testee il est possible qu'elle ne
  #fonctionne pas car il y a une double relation entre User et Housing
  has_and_belongs_to_many :users, :class_name => "Favorites"
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :housing_pois, :allow_destroy => true

  validates :phone_contact, :presence => true
  validates :name, :presence => true
  validates :housing_type, :presence => true
  validates :distance_commerce, :presence => true
  validates :distance_train, :presence => true
  validates :distance_transport, :presence => true
  validates :website, :format => /^(http|https):\/\/.*/

  attr_accessor :housing_type_text

  def join_last(arr)
    return '' if not arr
    case arr.size
      when 0 then ''
      when 1 then arr[0]
      when 2 then arr.join(' ' + I18n.t('and') + ' ')
      else arr[0..-2].join(', ') + ' ' + I18n.t('and') + ' ' + arr[-1]
    end
  end
end

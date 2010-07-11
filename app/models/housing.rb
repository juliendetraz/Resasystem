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

  validates :name, :presence => true

  state_machine :initial => :parked do
      before_transition :parked => any - :parked, :do => :put_on_seatbelt
      after_transition any => :parked do |vehicle, transition|
        vehicle.seatbelt = 'off'
      end
      around_transition :benchmark

      event :ignite do
        transition :parked => :idling
      end

      state :first_gear, :second_gear do
        validates :seatbelt_on, :presence => true
      end
    end # state machine

    def put_on_seatbelt

    end

    def benchmark

    end
end

class User < ActiveRecord::Base
  has_many :housings
  has_many :messages

  belongs_to :address

  # FIXME Primary key is not allowed in a has_and_belongs_to_many join table (organizations_users)
  #has_and_belongs_to_many :organizations
  #TODO cette relation n'a pas ete testee il est possible qu'elle ne
  #fonctionne pas car il y a une double relation entre User et Housing
#  has_and_belongs_to_many :housings, :class_name => "Favorites"

  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :gender, 
                  :first_name, 
                  :last_name, 
                  :phone_contact, 
                  :phone_fax, 
                  :phone_mobile, 
                  :phone_pro, 
                  :phone_home, 
                  :language, 
                  :firstday_week

  
  def full_name
    "#{first_name} #{last_name}"
  end
end

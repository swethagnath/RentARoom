class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :last_name,:first_name,:username,:mobile_number,:role_id
  validates_uniqueness_of :username
  validates_length_of :mobile_number,is:10
  belongs_to :role
  has_many :rooms
  has_many :bookings
  devise :database_authenticatable, :authentication_keys => [:username]
  before_validation :role_default_guest,on: :create
  def role_default_guest  
      #if self.rooms.empty?
      #elsif self.role.name == "admin"
      #elsif self.role.name == "guest"
      #self.role_id = Role.last.id
      #end
    	self.role_id = Role.second.id   
  end
  def role?(role)
    self.role.name == role
  end
end
























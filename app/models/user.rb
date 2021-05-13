class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ##Relationship##

  has_many :posts

  ## Validations ##
  validates :first_name, :last_name, :presence => true

  
  ##instance_methods##

  def admin_user?
  	self.user_type == 1
  end
end

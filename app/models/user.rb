class User < ActiveRecord::Base

  has_and_belongs_to_many :roles

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :date_of_birth, :school, :university

  validates_presence_of :name, :surname

  before_create :init_user

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.downcase)
  end

  def init_user
    self.roles << Role.find_by_name("user")
  end

end


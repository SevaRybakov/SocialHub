class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_many :posts

  # Friendship associations
  
  # 1) actual friends;
  has_many :friendships
  has_many :friends, :through => :friendships, 
                     :conditions => { :is_confirmed => true }
  
  # 2) wanted friends 
  # (the people our user has sent friendship request to);
  has_many :wanted_friendships, :class_name => "Friendship",
           :conditions => { :is_confirmed => false }
  
  has_many :wanted_friends, :through => :wanted_friendships, 
           :source => :friend
  
  # 3) potential friends
  # (those who have sent friendship request to our user ).
  has_many :friendship_requests, :class_name => "Friendship", 
           :foreign_key => "friend_id",
           :conditions => { :is_confirmed => false }
  has_many :potential_friends, :through => :friendship_requests,
                             :source => :user

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

  def friend?(user)
    !!Friendship.where( :is_confirmed => true,
                      :user_id => user.id,
                      :friend_id => self.id )
  end
end


# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  name                   :string(255)
#  surname                :string(255)
#  date_of_birth          :date
#  school                 :string(255)
#  university             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#


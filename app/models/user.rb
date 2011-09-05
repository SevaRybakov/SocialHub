class User < ActiveRecord::Base


  has_and_belongs_to_many :roles
  has_many :posts, :foreign_key => "user_to_id"
  has_many :friends_statistics
  
  has_attached_file :avatar, :styles => { :profile => '220x400>', :wall => '50x50#' }
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  # Friendship associations

  # 1) actual friends;
  has_many :friendships,
           :conditions => { :is_confirmed => true }
  has_many :friends, :through => :friendships

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

  has_many :albums, :dependent => :destroy

  validates_presence_of :name, :surname


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :date_of_birth, :school, :university, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at



  before_create :init_user

  def full_name
    "#{self.name} #{self.surname}"
  end

  def friend_of?(user)
     self.friends.include? user
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.downcase)
  end

  def get_older_posts created_at = nil
    created_at ||= Time.now
    Post.where("created_at < ? AND ( user_to_id = ? OR ( user_from_id IN ( ? ) AND is_status IS TRUE ))", created_at, self.id, self.friend_ids ).
      order("created_at DESC").limit(10).includes([:user_to, :user_from]).all
  end

  def get_new_posts created_at = nil
    created_at ||= Time.now
     Post.where("created_at > ? AND ( user_to_id = ? OR ( user_from_id IN ( ? ) AND is_status IS TRUE ))", created_at, self.id, self.friend_ids ).
      order("created_at DESC").includes([:user_to, :user_from]).all
  end


  def online?
    Time.now - self.last_activity_at < 3.minutes
  end

  def can_send_friendship_request_to?(another_user)
    self != another_user &&
    !self.friends.include?(another_user) &&
    !self.wanted_friends.include?(another_user) &&
    !self.potential_friends.include?(another_user)
  end
  
  #Searching the users
  
  def self.search(query)
    result = []
    
    begin
      conditions = <<-EOS
        to_tsvector( 'english',
          coalesce(name, '') || ' ' ||
          coalesce(surname, '') || ' '  || 
          coalesce(school, '') || ' ' ||
          coalesce(university, '')
        ) @@ to_tsquery('english', ?)
      EOS
      result = where(conditions, convert_to_tsquery(query))
      
      
    
    rescue ActiveRecord::StatementInvalid
      
    end
    
    result
  end
  
  
  
  private ######################################
  
  def init_user
    self.roles << Role.find_by_name("user")
    self.last_activity_at = Time.now
  end
  
  def self.convert_to_tsquery(query)
    query.gsub(/!/, '\!').gsub(/\|/, '\|').gsub(/&/, '\&').gsub(/(?:^|\s+)[nN][oO][tT]\s/, '!').gsub(/\s+[aA][nN][dD]\s/, '&').gsub(/\s+/, '|')
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
#  last_activity_at       :datetime
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#


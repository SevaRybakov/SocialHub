class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  validates_presence_of :user_id
  validates_presence_of :friend_id
  
  before_update :create_inverted_clone_if_confirmed
  before_destroy :delete_inverted_clone
  
  attr_accessible :user_id, :friend_id, :is_confirmed
  
  def confirm
    self.is_confirmed = true
    self.save
  end
  
  private ####################################################################
  
  def create_inverted_clone_if_confirmed
    if self.is_confirmed
      self.class.create!(:user_id => self.friend_id,
                         :friend_id => self.user_id,
                         :is_confirmed => true)
    end
  end
  
  def delete_inverted_clone
    self.class.where(:user_id => self.friend_id,
                     :friend_id => self.user_id).delete_all
  end
  
end

# == Schema Information
#
# Table name: friendships
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  friend_id    :integer
#  is_confirmed :boolean         default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#


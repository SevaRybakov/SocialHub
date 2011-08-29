class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  validates_presence_of :user_id
  validates_presence_of :friend_id
  validates_uniqueness_of :user_id, :scope => :friend_id
  
  attr_accessible :user_id, :friend_id, :is_confirmed
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


class Post < ActiveRecord::Base
  belongs_to :user_to, :class_name => "User"
  belongs_to :user_from, :class_name => "User"

  scope :current_status, where(:is_status => true)#.order("created_at DESC").first

  validates_presence_of :user_to, :user_from, :content, :post_type

  validates_length_of :content, :maximum => 65535
  validates_length_of :content, :maximum => 20, :if => :is_status

  attr_accessible :user_to, :user_from, :content, :post_type, :created_at, :is_status

end



# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  user_to_id   :integer
#  user_from_id :integer
#  content      :string(65535)
#  post_type    :string(255)
#  media_url    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  is_status    :boolean
#


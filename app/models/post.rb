class Post < ActiveRecord::Base
  belongs_to :user_to, :class_name => "User"
  belongs_to :user_from, :class_name => "User"

  validates_presence_of :user_to, :user_from, :content, :post_type

  attr_accessible :user_to, :user_from, :content, :post_type, :created_at
end


# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  user_to_id   :integer
#  user_from_id :integer
#  content      :string(255)
#  post_type    :string(255)
#  media_url    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#


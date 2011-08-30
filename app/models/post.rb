class Post < ActiveRecord::Base
  belongs_to :user_to, :class_name => "User"
  belongs_to :user_from, :class_name => "User"

  validates_presence_of :user_to, :user_from, :content, :post_type

  attr_accessible :user_to, :user_from, :content, :post_type
end


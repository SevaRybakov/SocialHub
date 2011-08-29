class Post < ActiveRecord::Base
  belongs_to :user_to
  belongs_to :user_from
end

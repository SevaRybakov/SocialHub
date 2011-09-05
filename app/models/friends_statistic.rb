class FriendsStatistic < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: friends_statistics
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  count      :integer
#  created_at :datetime
#  updated_at :datetime
#


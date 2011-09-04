class FriendshipStatistics

  def perform
    User.all.each do |user|
      user.friends_statistics.build :count => user.friends.size
      user.save
    end
  end

end


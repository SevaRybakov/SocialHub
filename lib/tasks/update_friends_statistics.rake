namespace :update_friends_statistics do
  desc 'update friends statistics delay job'
  task :add => :environment do
    Delayed::Job.enqueue FriendshipStatistics.new
  end
end


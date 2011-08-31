class FriendshipController < ApplicationController

  before_filter :get_user, :only => [:send_request]

  def index
    @established = @friend.friendships
    @requests = @friend.friendship_requests
    @wanted = @friend.wanted_friendships
  end

  def send_request
    if current_user.can_send_friendship_request_to? @friend &&
      Friendship.create( :user_id => current_user.id, 
                         :friend_id => @friend.id)
      
      flash[:success] = "#{@friend.name} will be notified about your friendship request"
    else
      flash[:error] = "Error occured while requesting friendship from #{@friend.name}"
    end
    redirect_to user_path @friend
  end
  
  def get_user
    @friend ||= User.find params[:friend_id]
  end
  
end
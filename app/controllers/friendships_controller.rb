class FriendshipsController < ApplicationController

  before_filter :get_friend, :only => [:send_request]
  before_filter :get_user, :only => [:index]

  def index
    @established = @user.friendships
    @requests = @user.friendship_requests
    @wanted = @user.wanted_friendships
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
  
  private ####################################################################
  
  def get_user
    @user ||= User.find params[:user_id]
  end
  
  def get_friend
    @friend ||= User.find params[:friend_id]
  end
  
end
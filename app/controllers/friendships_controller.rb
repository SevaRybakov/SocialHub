class FriendshipsController < ApplicationController

  before_filter :get_user, :only => [:index]
  before_filter :get_friend, :only => [:send_request]

  def index
    @established = @user.friendships
    @online = @user.friendships.select{|fr| fr.friend.online? }
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
  
  def confirm
    @friendship ||= Friendship.find params[:friendship_id]
    @friendship.is_confirmed = true
    if @friendship.save
      flash[:success] = "Friendship established!"
    else
      flash[:error] = "Error occured while establishing friendship"
    end
    redirect_to user_path current_user
  end
  
  def cancel
    @friendship ||= Friendship.find params[:friendship_id]
    if @friendship.destroy
      flash[:success] = "You are no longer friends"
    else
      flash[:error] = "Error"
    end
    redirect_to user_path current_user
  end
  
  private ####################################################
  
  def get_friend
    @friend ||= User.find params[:friend_id]
  end
  
  def get_user
    @user ||= User.find params[:user_id]
  end
  
end
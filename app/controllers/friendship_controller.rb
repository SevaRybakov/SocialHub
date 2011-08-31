class FriendshipController < ApplicationController
  def send_request
    friend = User.find params[:id]
    if current_user.can_request_friendship_from? friend &&
      Friendship.create( :user_id => current_user.id, 
                         :friend_id => params[:id])
      
      flash[:success] = "#{friend.name} will be notified about your friendship request"
    else
      flash[:error] = "Error occured while requesting friendship from #{friend.name}"
    end
    redirect_to user_path friend
  end
end
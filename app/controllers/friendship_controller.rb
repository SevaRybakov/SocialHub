class FriendshipController < ApplicationController
  def request
    if Friendship.create :user_id => current_user.id, 
                         :friend_id => params[:friend_id]
      flash[:success] = "John will be notified about your friendship request"
      redirect_to :root
    end
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :update_user_activity

  def home
    if user_signed_in?
      redirect_to user_path current_user
    else
      redirect_to :new_user_session
    end
  end

  def find_and_check_user
    @user = User.find params[:user_id]
    redirect_to "/404.html" if @user.nil?
  end

  def update_user_activity
    if current_user
      current_user.last_activity_at = Time.now
      current_user.save
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end



end


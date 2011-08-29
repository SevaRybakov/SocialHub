class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to user_path current_user
    else
      redirect_to :new_user_session
    end
  end

  def find_and_check_user
<<<<<<< HEAD

=======
>>>>>>> Fixed User Controller bag that didn't allow user to browse other user pages. Started work on cucumber for Add Friend Subfeature
    @user = User.find params[:id]
    redirect_to "/404.html" if @user.nil?
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end


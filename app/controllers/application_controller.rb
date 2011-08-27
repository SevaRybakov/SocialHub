class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to person_path current_user
    else
      redirect_to :new_user_session
    end
  end
end


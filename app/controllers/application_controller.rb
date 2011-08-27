class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    unless user_signed_in?
      redirect_to :new_user_session
    end
  end
end


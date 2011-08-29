class UsersController < ApplicationController

  load_and_authorize_resource :except => [:show]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    flash[:success] = "User successfully destroyed."
    redirect_to users_path
  end

  def show

  end

  def edit

  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "User successfully updated."
      redirect_to user_path @user
    else
      flash[:error] = "Error with updating user."
      redirect_to edit_user_path @user
    end
  end

end


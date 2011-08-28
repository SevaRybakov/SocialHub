class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    authorize! :manage, User
    @users = User.all
  end

  def destroy
    authorize! :manage, User
    @user.destroy
    flash[:notice] = "User successfully destroyed."
    redirect_to users_path
  end

  def show

  end

  def edit

  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User successfully updated."
      redirect_to user_path @user
    else
      flash[:alert] = "Error with updating user."
      redirect_to edit_user_path @user
    end
  end

end


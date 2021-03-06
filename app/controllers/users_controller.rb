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
    @user = User.find_by_id params[:id]
    redirect_to "/404.html" if @user.nil?
    @posts = @user.get_older_posts
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


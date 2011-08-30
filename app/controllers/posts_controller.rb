class PostsController < ApplicationController

  def index
    find_and_check_user
    @posts = Post.where("user_to_id = ?", @user.id).order("created_at DESC")
  end

  def show
    find_and_check_user
    @post = Post.find_by_id(params[:id])
  end

  def new
    find_and_check_user
    @post = Post.new
  end

  def edit
    find_and_check_user
    @post = Post.find_by_id(params[:id])
  end

  def create
    find_and_check_user
    @post = Post.new(params[:post])
    @post.user_to = @user
    @post.user_from = current_user
    @post.post_type = "post"
    respond_to do |format|
      if @post.save
        flash[:success] = "Post successfully created."
        format.html { redirect_to user_posts_path @user }
        format.js
      else
        flash[:error] = "Error with creating new post."
        redirect_to new_user_post_path(@user)
      end
    end
  end

  def update
    find_and_check_user
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post successfully updated."
      redirect_to user_posts_path @user
    else
      flash[:error] = "Error with updating post."
      redirect_to edit_user_post_path @user, @post
    end
  end


end


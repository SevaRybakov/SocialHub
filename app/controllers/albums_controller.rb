class AlbumsController < ApplicationController
  
  before_filter :find_and_check_user
  before_filter :get_album, :only => [:show, :edit, :update, :destroy]
  
  def index
    @albums = @user.albums
  end

  def show
    @photos = @album.photos
  end

  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new params[:album]
    @album.user = @user
    if @album.save
      flash[:success] = "You've just successfully created an album"
    end
    redirect_to user_albums_path @user
  end

  def edit
  end

  def update
    @album.update_attributes params[:album]
    if @album.save
      flash[:success] = "You've just successfully renamed an album"
    end
    redirect_to user_albums_path @user
  end

  def destroy
    if @album.destroy
      flash[:warning] = "You've successfully deleted album"
    end
    redirect_to user_albums_path @user
  end

  private #################################
  def get_album
    @album ||= Album.find params[:id]
  end

end
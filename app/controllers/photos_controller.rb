class PhotosController < ApplicationController
  
  before_filter :get_user_and_album
  before_filter :get_photo, :only => [:show, :edit, :update, :destroy]
  
  def index
    @photos = @album.photos
  end

  def show
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new params[:photo]
    @photo.album = @album
    if @photo.save
      flash[:success] = "You've just successfully uploaded photo"
    end
    redirect_to user_album_path @album.user, @album
  end

  def edit
  end

  def update
    @photo.update_attributes params[:photo]
    if @photo.save
      flash[:success] = "You've just successfully renamed an photo"
    end
    redirect_to user_album_photos_path @album.user, @album
  end

  def destroy
    if @photo.destroy
      flash[:warning] = "You've successfully deleted photo"
    end
    redirect_to user_album_photos_path @album.user, @album
  end

  private #################################
  
  def get_photo
    @photo ||= Photo.find params[:id]
  end
  
  def get_user_and_album
    @album ||= Album.find params[:album_id]
    @user ||= @album.user
  end

end
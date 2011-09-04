class PhotosController < ApplicationController
  
  before_filter :get_album
  
  def index
    redirect_to @album
  end

  def show
    @photo = Photo.find params[:id]
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new params[:photo]
    @photo.album = @album
    if @photo.save
      flash[:success] = "You have successfully added a photo"
    end
    redirect_to @album
  end
  
  def destroy
    
  end

  private #######################################################
  
  def get_album
    @album ||= Album.find params[:album_id]
  end

end

class PhotosController < ApplicationController

  private #############################################
  
  def get_album
    @album = Album.find params[:album_id]
  end
end
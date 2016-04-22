class AlbumsController < ApplicationController
  def index
    @albums = Album.where artist_id: params[:artist_id]
  end
end

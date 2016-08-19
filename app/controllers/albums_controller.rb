class AlbumsController < ApplicationController
  before_action :find_artist, only: [:index, :new]

  def index
    @albums = @artist.albums.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = @artist.albums.build
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

end

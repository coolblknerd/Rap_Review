class AlbumsController < ApplicationController
  before_action :find_artist, only: [:index, :new, :create, :destroy]
  before_action :find_album, only: [:show, :edit, :update]

  def index
    @albums = @artist.albums.all
  end

  def show
  end

  def new
    @album = @artist.albums.build
  end

  def create
    @album = @artist.albums.create(album_params)
    authorize @album

    if @album.save
      redirect_to album_path(@album)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @album
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album = @artist.albums.find(params[:id])
    authorize @album
    @album.destroy

    redirect_to artists_path
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:title, :label)
  end

  def find_album
    @album = Album.find(params[:id])
  end
end

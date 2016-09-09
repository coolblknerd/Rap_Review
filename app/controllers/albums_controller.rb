class AlbumsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_artist, only: [:index, :new, :create]
  before_action :find_album, only: [:show, :edit, :update, :destroy]

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
      flash[:success] = 'Album successfully created'
      redirect_to artist_albums_path(@artist)
    else
      flash[:error] = "Sorry, the album didn't save"
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @album
    if @album.update(album_params)
      flash[:success] = "Album successfully updated"
      redirect_to @album
    else
      flash[:error] = "Sorry, the album didn't update"
      render 'edit'
    end
  end

  def destroy
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

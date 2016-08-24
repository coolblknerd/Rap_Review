class SongsController < ApplicationController
  before_action :find_album, only: [ :new, :create, :destroy]
  before_action :find_song, only: [:show, :edit, :update]

  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.all
  end

  def show
  end

  def new
    @song = @album.songs.build
  end

  def create
    @song = @album.songs.create(song_params)

    if @song.save
      redirect_to @song
    else
      render 'new'
    end

  end

  def edit
  end

  def update

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render 'edit'
    end

  end

  def destroy
    @song = @album.songs.find(params[:id])
    @song.destroy

    redirect_to artists_path
  end

  private

  def find_album
    @album = Album.find(params[:album_id])
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :features, :writers)
  end

end

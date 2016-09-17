class SongsController < ApplicationController
  before_action :find_album, only: [:new, :create]
  before_action :find_song, only: [:show, :edit, :update, :destroy]

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
    @song = @album.songs.build(song_params)
    add_artist_id
    authorize @song

    if @song.save
      flash[:success] = 'Song successfully created'
      redirect_to album_path(@album)
    else
      flash[:error] = 'Sorry, we could not save your song'
      render 'new'
    end

  end

  def edit
  end

  def update
    authorize @song

    if @song.update(update_song_params)
      flash[:success] = 'Song successfully updated'
      redirect_to album_path(@song) # <= 'Question emoji' face
    else
      flash[:error] = 'Sorry, we could not update your song'
      render 'edit'
    end

  end

  def destroy
    authorize @song
    @song.destroy

    redirect_to artists_path
  end

  private

  def add_artist_id
    @song.artist_id = @album.artist_id
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def find_album
    @album = Album.find(params[:album_id])
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :features, :writers, :artist_id => @album.artist_id)
  end

  def update_song_params
    params.require(:song).permit(:title, :features, :writers)
  end

end

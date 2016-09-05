class ArtistsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    authorize @artist

    if @artist.save
      flash[:success] = "Artist Created"
      redirect_to @artist
    else
      flash[:error] = "Sorry, We Couldn't Save the Artist"
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @artist

    if @artist.update(artist_params)
      flash[:success] = "Artist successfully updated"
      redirect_to @artist
    else
      flash[:error] = "Please enter valid values"
      render 'edit'
    end
  end

  def destroy
    authorize @artist
    @artist.destroy
    flash[:succes] = "Artist successfully deleted"
    redirect_to artists_path
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio, :origin)
  end

end

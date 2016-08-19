require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:artist) { FactoryGirl.create(:artist) }
  let(:album) { FactoryGirl.create(:album) }

  describe "GET index" do

    it "assigns @artist" do
      get :index, artist_id: artist
      expect(assigns(:artist)).to eq(artist)
    end

    it "assigns @albums" do
      get :index, artist_id: artist, album: album
      expect(assigns(:albums)).to eq([album])
    end

    it "renders the index template" do
      get :index, artist_id: artist, album: album
      response.should render_template('index')
    end
  end # -- end of GET index --

  describe "GET show" do

    it "assigns @album" do
      get :show, artist_id: artist, id: album
      expect(assigns(:album)).to eq(album)
    end

    it "renders the show template" do
      get :show, artist_id: artist, id: album
      response.should render_template('show')
    end
  end # -- end of GET show --

  describe "GET new" do

    it "assigns @artist" do
      get :new, artist_id: artist
      expect(assigns(:artist)).to eq(artist)
    end

    it "assigns new instance in @album" do
      get :new, artist_id: artist
      expect(assigns(:album)).to be_a_new(Album)
    end

    it "renders the new template" do
      get :new, artist_id: artist
      response.should render_template('new')
    end
  end # -- end of GET new --

end

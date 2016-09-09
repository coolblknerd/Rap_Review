require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  let(:artist) { FactoryGirl.create(:artist) }
  let(:album) { FactoryGirl.create(:album) }
  let(:song) { FactoryGirl.create(:song) }
  let(:admin) { FactoryGirl.create(:user, :admin)}

  describe "GET index" do

    it "assigns @artist" do
      get :index, artist_id: artist
      assigns(:artist).should eq(artist)
    end

    it "assigns @songs" do
      get :index, artist_id: artist, album_id: album
      assigns(:songs).should eq([song])
    end

    it "renders index template" do
      get :index, artist_id: artist, album_id: album
      response.should render_template('index')
    end
  end # -- end of GET index --

  describe "GET show" do

    it "assigns @song" do
      get :show, artist_id: artist, album_id: album, id: song
      assigns(:song).should eq(song)
    end

    it "renders show template" do
      get :show, artist_id: artist, album_id: album, id: song
      response.should render_template('show')
    end
  end # -- end of GET show --

  describe "GET new" do

    it "assigns new instance in @song" do
      get :new, artist_id: artist, album_id: album
      assigns(:song).should be_a_new(Song)
    end

    it "renders the new template" do
      get :new, artist_id: artist, album_id: album
      response.should render_template('new')
    end
  end # -- end of GET new --

  describe "POST create" do

    context "with valid attributes" do

      it "add a new song" do
        sign_in admin
        expect{
          post :create, artist_id: artist, album_id: album, song: FactoryGirl.attributes_for(:song)
        }.to change(Song, :count).by(1)
      end

      it "redirects to the album show page" do
        sign_in admin
        post :create, artist_id: artist, album_id: album, song: FactoryGirl.attributes_for(:song)
        response.should redirect_to(album_path(album))
      end

    end

    context "with invalid attributes" do

      it "does not add a new song" do
        sign_in admin
        expect{
          post :create, artist_id: artist, album_id: album, song: FactoryGirl.attributes_for(:invalid_song)
        }.to change(Song, :count).by(0)
      end

      it "renders the new template" do
        sign_in admin
        post :create, artist_id: artist, album_id: album, song: FactoryGirl.attributes_for(:invalid_song)
        response.should render_template('new')
      end

    end

  end # -- end of POST create --

  describe "GET edit" do

    it "renders the edit template of the selected song & assigns song" do
      get :edit, artist_id: artist, album_id: album, id: song
      response.should render_template('edit')
      assigns(:song).should eq(song)
    end

  end # -- end of GET edit --

  describe "PUT update" do

    context "with valid attributes" do

      it "updates the song" do
        sign_in admin
        put :update, artist_id: artist, album_id: album, id: song, song: FactoryGirl.attributes_for(:song, title: "Wicked", features: true)
        song.reload
        song.title.should eq('Wicked')
        song.features.should be_truthy
        song.writers.should eq('Future')
      end

      it "redirects to song after updating" do
        sign_in admin
        put :update, artist_id: artist, album_id: album, id: song, song: FactoryGirl.attributes_for(:song, title: "Wicked", features: true)
        song.reload
        response.should redirect_to(song)
      end

    end

    context "with invalid attributes" do

      it "should not update the song" do
        sign_in admin
        put :update, artist_id: artist, album_id: album, id: song, song: FactoryGirl.attributes_for(:song, title: nil)
        song.reload
        song.title.should eq "Thought It Was a Drought"
        song.features.should be_falsey
      end

      it "should render the edit page" do
        sign_in admin
        put :update, artist_id: artist, album_id: album, id: song, song: FactoryGirl.attributes_for(:song, title: nil)
        song.reload
        response.should render_template 'edit'
      end
    end
  end # -- end of PUT update --

  describe "DELETE destroy" do

    before :each do
      @artist = FactoryGirl.create(:artist)
      @album = FactoryGirl.create(:album)
      @song = FactoryGirl.create(:song)
    end

    it "removes the song" do
      sign_in admin
      expect{
        delete :destroy, id: @song
      }.to change(Song, :count).by(-1)
    end

    it "redirect_to artist page" do
      sign_in admin
      delete :destroy, id: @song
      response.should redirect_to(artists_path)
    end
  end
end

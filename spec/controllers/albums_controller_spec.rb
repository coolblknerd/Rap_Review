require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:artist) { FactoryGirl.create(:artist) }
  let(:album) { FactoryGirl.create(:album) }
  let(:user) { FactoryGirl.create(:user, :admin)}

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

  describe "POST create" do

    context "with valid attributes" do

      it "adds a new album" do
        sign_in user
        expect{ post :create, artist_id: artist, album: FactoryGirl.attributes_for(:album) }.to change(Album, :count).by(1)
      end

      it "redirects to the album page" do
        sign_in user
        post :create, artist_id: artist, album: FactoryGirl.attributes_for(:album)
        response.should redirect_to(Album.last)
      end
    end

    context "with invalid attributes" do

      it "does not add album" do
        sign_in user
        expect{ post :create, artist_id: artist, album: FactoryGirl.attributes_for(:invalid_album) }.to change(Album, :count).by(0)
      end

      it "renders the new template" do
        sign_in user
        post :create, artist_id: artist, album: FactoryGirl.attributes_for(:invalid_album)
        response.should render_template('new')
      end
    end

  end # -- end of POST create --

  describe "GET edit" do

    it "renders the edit template of the selected album & assigns album" do
      get :edit, artist_id: artist, id: album
      expect(assigns(:album)).to eq(album)
      response.should render_template('edit')
    end

  end # -- end of GET edit --

  describe "PUT update" do

    context "with valid attributes" do

      it "assigns @album" do
        sign_in user
        put :update, artist_id: artist, id: album, album: FactoryGirl.attributes_for(:album)
        assigns(:album).should eq(album)
      end

      it "changes the attributes of the album" do
        sign_in user
        put :update, artist_id: artist, id: album, album: FactoryGirl.attributes_for(:album, title: "56 Nights", label: "Cash Money")
        album.reload
        album.title.should_not eq('DS2')
        album.label.should eq('Cash Money')
      end

      it "redirects to artist page" do
        sign_in user
        put :update, artist_id: artist, id: album, album: FactoryGirl.attributes_for(:album, title: '56 Nights', label: 'Cash Money')
        album.reload
        response.should redirect_to album
      end
    end

    context "with invalid attributes" do

      it "does not change the attributes of the album" do
        sign_in user
        put :update, artist_id: artist, id: album, album: FactoryGirl.attributes_for(:album, title: nil)
        album.reload
        album.title.should eq('DS2')
      end

      it "renders the edit page" do
        sign_in user
        put :update, artist_id: artist, id: album, album: FactoryGirl.attributes_for(:album, title: nil)
        album.reload
        response.should render_template('edit')
      end
    end

  end # -- end of PUT update --

  describe "DELETE destroy" do
    before :each do
      @artist = FactoryGirl.create(:artist)
      @album = FactoryGirl.create(:album)
    end

    it "assigns @album" do
      sign_in user
      delete :destroy, artist_id: @artist, id: @album
      assigns(:album).should eq(@album)
    end

    it "removes the album" do
      sign_in user
      expect{
         delete :destroy, artist_id: @artist, id: @album
       }.to change(Album, :count).by(-1)
    end
  end # -- end of DELETE destroy --

end

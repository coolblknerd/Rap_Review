require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

  let(:user) { FactoryGirl.create(:user, :admin)}

  describe "GET index" do

    it "assigns @artists" do
      artist = FactoryGirl.create(:artist)
      get :index
      expect(assigns(:artists)).to eq([artist])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end # -- end of GET index --

  describe "GET show" do
    let(:artist) { FactoryGirl.create(:artist) }

    it "assigns @artist" do
      get :show, id: artist
      expect(assigns(:artist)).to eq(artist)
    end

    it "status returns 200 when rendered" do
      get :show, id: artist
      expect(response.status).to eq(200)
    end
  end # -- end of GET show --

  describe "GET new" do
    let(:artist) { Artist.new }

    it "assigns @artist" do
      sign_in user
      get :new
      expect(assigns(:artist)).to be_a_new(Artist)
    end

    it "renders the new template" do
      sign_in user
      get :new
      expect(response).to render_template('new')
    end
  end # -- end of GET new --

  describe "POST create" do

    context "with valid attributes" do

      it "redirects to the new artist page" do
        sign_in user
        post :create, artist: FactoryGirl.attributes_for(:artist)
        expect(response).to redirect_to Artist.last
      end

      it "adds a new artist" do
        sign_in user
        expect{ post :create, artist: FactoryGirl.attributes_for(:artist) }.to change(Artist, :count).by(1)
      end
    end

    context "with invalid attributes" do

      it "renders the new template" do
        sign_in user
        post :create, artist: FactoryGirl.attributes_for(:invalid_artist)
        expect(response).to render_template 'new'
      end

      it "does not save the new artist" do
        sign_in user
        expect{ post :create, artist: FactoryGirl.attributes_for(:invalid_artist) }.to change(Artist, :count).by(0)
      end
    end
  end # -- end of POST create --

  describe "GET edit" do

    it "renders the selected artist edit page & assigns @artist" do
      sign_in user
      artist = FactoryGirl.create(:artist)
      get :edit, id: artist
      response.should render_template('edit')
      expect(assigns(:artist)).to eq(artist)
    end
  end # -- end of GET edit --

  describe "PUT update" do

    before :each do
      sign_in user
      @artist = FactoryGirl.create(:artist)
    end

    context "with valid attributes" do

      it "locate the selected artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist)
        assigns(:artist).should eq(@artist)
      end

      it "change the attributes of the artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist, name: "Drake", origin: "Toronto, ON", bio: "the GOAT")
        @artist.reload
        @artist.name.should eq('Drake')
        @artist.origin.should eq('Toronto, ON')
        @artist.bio.should eq('the GOAT')
      end

      it "redirects to the updated artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist)
        response.should redirect_to @artist
      end
    end

    context "with invalid attributes" do

      it "does not change the attributes of the artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist, name: 'Drake', origin: nil, bio: 'the greatest ever')
        @artist.reload
        @artist.name.should_not eq('Drake')
        @artist.origin.should eq('Atlanta, GA')
      end

      it "renders the edit page" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist, name: 'Drake', origin: nil, bio: 'the greatest ever')
        response.should render_template('edit')
      end
    end
  end # -- end of PUT create --

  describe "DELETE destroy" do
    before :each do
      @artist = FactoryGirl.create(:artist)
    end

    it "deletes the selected artist" do
      sign_in user
      expect{
        delete :destroy, id: @artist
      }.to change(Artist, :count).by(-1)
    end

    it "redirects to artist index path" do
      sign_in user
      delete :destroy, id: @artist
      response.should redirect_to(artists_path)
    end

  end
end

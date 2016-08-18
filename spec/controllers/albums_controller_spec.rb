require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET index" do
    let(:artist) { FactoryGirl.create(:artist) }
    let(:album) { FactoryGirl.create(:album) }

    it "returns a list of albums belonging to artist" do
      get :index
      album.should belong_to(artist)
    end
  end

end

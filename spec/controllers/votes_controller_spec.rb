require 'rails_helper'

RSpec.describe VotesController, type: :controller do

  let(:artist) { FactoryGirl.create(:artist) }
  let(:album) { FactoryGirl.create(:album) }
  let(:song) { FactoryGirl.create(:song) }
  let(:vote) { FactoryGirl.create(:vote) }

  describe "PUT upvote" do

    it "adds a like to vote" do
      expect{
        put :upvote, artist_id: artist, album_id: album, song_id: song, id: vote
      }.to change(vote, :likes).by(1)
    end

  end

end

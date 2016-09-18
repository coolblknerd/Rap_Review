require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe "initialization" do
    let(:views) { Song.new(title: "Views", features: false, writers: "Drake", id: 1) }
    let(:view_vote) { Vote.new(likes: 0, dislikes: 0, song_id: 1)}

    it { should belong_to(:song) }
    it { view_vote.should be_valid }
    it { view_vote.likes.should eq(0)}
    it { view_vote.song_id.should eq(views.id)}

  end

end

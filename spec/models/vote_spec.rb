require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe "initialization" do
    let(:views) { Song.create(title: "Views", features: false, writers: "Drake") }
    let(:vote) { Vote.create(song_id: views.id)}

    it { should belong_to(:song) }
    it { vote.should be_valid }
    it { vote.song_id.should eq(views.id) }
    it { should have_many(:likes) }
  end

end

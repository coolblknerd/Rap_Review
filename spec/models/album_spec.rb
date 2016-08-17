require "rails_helper"

RSpec.describe Album do

  describe "initialization" do
    let(:album) { FactoryGirl.create(:album) }

    it { album.should be_valid }
    it { album.should have_many(:songs) }
    it { album.should belong_to(:artist) }
    it { album.should validate_presence_of(:title) }
    it { album.should validate_presence_of(:label) }

    it "defaults to 'Independent' if label is nil" do
      album = FactoryGirl.create(:album, label: nil)
      album.should eq("Independent")
    end
  end
end

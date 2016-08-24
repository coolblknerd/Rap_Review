require "rails_helper"

RSpec.describe Album do

  describe "initialization" do
    let(:album) { FactoryGirl.build(:album) }

    it { album.should be_valid }
    it { album.should have_many(:songs) }
    it { album.should belong_to(:artist) }
    it { album.should validate_presence_of(:title) }
    it { album.should validate_presence_of(:label) }

    it "defaults label to 'Independent' if nil" do
      views = Album.new(title: "Views", label: nil)
      views.label.should eq("Independent")
    end
  end
end

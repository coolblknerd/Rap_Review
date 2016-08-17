require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe "initialization" do
    let(:artist) { FactoryGirl.create(:artist) }

    it { artist.should be_valid }
    it { artist.should have_many(:albums) }
    it { artist.should have_many(:songs) }
    it { artist.name.should eq('Future') }
    it { artist.should validate_presence_of(:name) }
    it { artist.should validate_presence_of(:origin) }
    it { artist.origin.should eq('Atlanta, GA')}
  end
end

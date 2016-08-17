require 'rails_helper'

RSpec.describe Song, type: :model do

  describe "initialization" do
    let(:views) { Song.new(title: "Views", features: false, writers: "Drake") }

    it { should belong_to(:album) }
    it { should belong_to(:artist) }

    it "returns the title of the song" do
      expect(views.title).to eq("Views")
    end

    it "returns on false on the features" do
      expect(views.features).to be_falsey
    end

    it "returns the writers of the song" do
      expect(views.writers).to eq("Drake")
    end

    it { views.should be_valid }
  end
end

require "rails_helper"

RSpec.describe Album do

  describe "initialization" do
    let(:album) { Album.new(title: "2001") }

    it "returns a title" do
      expect(album.title).to eq("2001")
    end
  end

  describe "rating system" do
    let(:album) { Album.new(title: "2001", artist: "Dr. Dre", label: "Aftermath")}

    it "returns a maximum rating" do
      expect(album.max_rating).to eq(10)
    end

    it "returns a minimum rating" do
      expect(album.min_rating).to eq(1)
    end

    it "takes a custom rating" do
      expect(album.user_rating(6)).to eq(6.0)
    end
  end
end

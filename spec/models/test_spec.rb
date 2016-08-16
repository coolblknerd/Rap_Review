require "rails_helper"

RSpec.describe Test do
  it "tells me hello" do
    test = Test.new
    expect(test.hello).to eq("hello")
  end
end

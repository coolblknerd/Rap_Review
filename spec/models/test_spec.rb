require "rails_helper"

RSpec.describe Test do
  it "tells me a name" do
    test = Test.new(name: "Reggie")
    expect(test.hello).to eq("Reggie")
  end
end

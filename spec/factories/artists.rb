FactoryGirl.define do
  factory :artist do |f|
    f.name "Future"
    f.origin "Atlanta, GA"
    f.bio "Born and raised in Atlanta, Georgia, Wilburn first became involved in music as part of the Dungeon Family collective, where he received the nickname 'the Future'."
    f.id 1
  end

  factory :invalid_artist, parent: :artist do |f|
    f.name nil
  end
end

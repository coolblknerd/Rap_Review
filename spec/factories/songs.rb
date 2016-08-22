FactoryGirl.define do
  factory :song do |f|
    f.title "Thought It Was a Drought"
    f.features false
    f.writers "Future"
    f.album_id 1
    f.artist_id 1
    f.id 1
  end

  factory :invalid_song, parent: :song do |f|
    f.title nil
  end
end

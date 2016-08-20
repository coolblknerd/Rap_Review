FactoryGirl.define do
  factory :album do |f|
    f.title "DS2"
    f.label "Freebandz/Epic"
    f.artist_id 1
    f.id 1
  end

  factory :invalid_album, parent: :album do |f|
    f.title nil
  end
end

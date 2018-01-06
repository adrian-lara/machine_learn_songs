FactoryBot.define do
  factory :song do
    sequence(:song_id) { |n| "id_#{n}" }
    sequence(:title) { |n| "title_#{n}" }
    sequence(:artists) { |n| "artist_#{n}" }
    sequence(:album) { |n| "album_#{n}" }
    album_cover "https://i.scdn.co/image/70429aaeceb7f8f6c087133382728223e0004b29"
  end
end

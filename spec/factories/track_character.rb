FactoryBot.define do
  factory :track_character do
    sequence(:track_id) { |n| "track_id_#{n}" }
  end
end

FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "user_id_#{n}" }
    sequence(:access_token) { |n| "access_token_#{n}" }
    sequence(:refresh_token) { |n| "refresh_token_#{n}" }
    token_type "Bearer"
  end
end

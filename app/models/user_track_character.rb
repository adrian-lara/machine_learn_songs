class UserTrackCharacter < ApplicationRecord
  belongs_to :track_character
  belongs_to :user

  enum assessment: ["Like", "Dislike"]
end

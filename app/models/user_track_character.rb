class UserTrackCharacter < ApplicationRecord
  belongs_to :track_character
  belongs_to :user
end

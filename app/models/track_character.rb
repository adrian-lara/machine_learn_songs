class TrackCharacter < ApplicationRecord
  validates :track_id, presence: true, uniqueness: true

  has_many :user_track_characters
  has_many :users, through: :user_track_characters
end

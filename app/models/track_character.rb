class TrackCharacter < ApplicationRecord
  validates :track_id, presence: true, uniqueness: true

  has_many :user_track_characters
  has_many :users, through: :user_track_characters

  def self.liked
    joins(:user_track_characters)
      .where({user_track_characters: {assessment: "Like"}})
  end

  def self.disliked
    joins(:user_track_characters)
      .where({user_track_characters: {assessment: "Dislike"}})
  end

  def self.calculable_attributes
    self.new.attributes.keys - ["id", "track_id", "created_at", "updated_at"]
  end
end

class User < ApplicationRecord

  has_many :user_track_characters
  has_many :track_characters, through: :user_track_characters

  def liked_songs
    track_characters.liked
  end

  def disliked_songs
    track_characters.disliked
  end
end

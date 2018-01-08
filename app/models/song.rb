class Song

  attr_reader :track_id, :title, :artists, :album, :album_cover, :assessment

  def initialize(song_info, user)
    @track_id = song_info[:item][:id]
    @title = song_info[:item][:name]
    @artists = get_artists(song_info)
    @album = song_info[:item][:album][:name]
    @album_cover = get_album_cover(song_info)
    @assessment = find_assessment(user)
  end

  private

    def find_assessment(user)
      track_character = TrackCharacter.find_by(track_id: track_id)
      user_track_character = UserTrackCharacter.find_by(user: user, track_character: track_character)
      if user_track_character
        user_track_character.assessment
      end
    end

    def get_artists(song_info)
      song_info[:item][:artists].map do |artist_info|
        artist_info[:name]
      end.join(", ")
    end

    def get_album_cover(song_info)
      images = song_info[:item][:album][:images]
      second_smallest = images[images.count - 2]
      second_smallest[:url] if second_smallest
    end

end

class SongAssessmentService

  def self.assess(user, track_id, assessment)
    data = get_audio_features(user, track_id)
    track_character = find_or_create_track_character(data)
    track_character.save
    create_user_track_character(track_character, user, assessment)
  end

  def self.find_or_create_track_character(data)
    track_character = TrackCharacter.find_by(track_id: data[:id])
    return track_character if track_character

    TrackCharacter.new({
      track_id: data[:id],
      acousticness: data[:acousticness],
      danceability: data[:danceability],
      duration_ms: data[:duration_ms],
      energy: data[:energy],
      instrumentalness: data[:instrumentalness],
      key: data[:key],
      liveness: data[:liveness],
      loudness: data[:loudness],
      mode: data[:mode],
      speechiness: data[:speechiness],
      tempo: data[:tempo],
      time_signature: data[:time_signature],
      valence: data[:valence]
      })
    end

  private

    def self.get_audio_features(user, track_id)
      service = SpotifyService.new(user)
      service.get_audio_features(track_id)
    end

    def self.create_user_track_character(track_character, user, assessment)
      UserTrackCharacter.create(
        user: user,
        track_character: track_character,
        assessment: assessment.to_i
      )
    end

end

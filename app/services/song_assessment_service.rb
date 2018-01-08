class SongAssessmentService

  def self.assess(data, user, assessment)
    track_character = create_track_character(data)
    create_user_track_character(track_character, user, assessment)
  end

  private

    def self.create_track_character(data)
      TrackCharacter.create({
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

    def self.create_user_track_character(track_character, user, assessment)
      UserTrackCharacter.create(
        user: user,
        track_character: track_character,
        assessment: assessment.to_i
      )
    end

end

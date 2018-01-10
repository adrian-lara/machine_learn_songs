class CreationService

  def initialize(user)
    @user = user
  end

  def currently_playing_song
    raw_song_data = spotify_service.currently_playing
    Song.new(raw_song_data, user) unless raw_song_data.nil?
  end

  def prediction(song)
    audio_features = get_audio_features(song.track_id)
    track_character = find_or_create_track_character(audio_features)
    prediction = Prediction.new(user)

    result = prediction.result(track_character)
  end

  def song_assessment(user, track_id, assessment)
    data = get_audio_features(track_id)
    track_character = find_or_create_track_character(data)
    track_character.save
    create_user_track_character(track_character, user, assessment)
  end

  def find_or_create_track_character(data)
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

    attr_reader :user

    def spotify_service
      @spotify_service ||= SpotifyService.new(user)
    end

      def get_audio_features(track_id)
        spotify_service.get_audio_features(track_id)
      end

      def create_user_track_character(track_character, user, assessment)
        UserTrackCharacter.create(
          user: user,
          track_character: track_character,
          assessment: assessment.to_i
        )
      end
end

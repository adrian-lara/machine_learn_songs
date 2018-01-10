module PredictionSetupHelper

  def self.create_four_liked_songs
    FactoryBot.create(:track_character,
        acousticness:         0.60,
        danceability:         0.60,
        duration_ms:          60,
        energy:               0.60,

        instrumentalness:     0,

        key:                  60,
        liveness:             0.60,
        loudness:             0.60,
        mode:                 60,
        speechiness:          0.60,
        tempo:                0.60,
        time_signature:       60,
        valence:              0.60
    )
    FactoryBot.create(:track_character,
        acousticness:         0.70,
        danceability:         0.70,
        duration_ms:          70,
        energy:               0.70,

        instrumentalness:     0,

        key:                  70,
        liveness:             0.70,
        loudness:             0.70,
        mode:                 70,
        speechiness:          0.70,
        tempo:                0.70,
        time_signature:       70,
        valence:              0.70
    )
    FactoryBot.create(:track_character,
        acousticness:         0.80,
        danceability:         0.80,
        duration_ms:          80,
        energy:               0.80,

        instrumentalness:     0,

        key:                  80,
        liveness:             0.80,
        loudness:             0.80,
        mode:                 80,
        speechiness:          0.80,
        tempo:                0.80,
        time_signature:       80,
        valence:              0.80
    )
    FactoryBot.create(:track_character,
        acousticness:         0.90,
        danceability:         0.90,
        duration_ms:          90,
        energy:               0.90,

        instrumentalness:     0,

        key:                  90,
        liveness:             0.90,
        loudness:             0.90,
        mode:                 90,
        speechiness:          0.90,
        tempo:                0.90,
        time_signature:       90,
        valence:              0.90
    )
    TrackCharacter.last(4)
  end

  def self.create_four_disliked_songs
    FactoryBot.create(:track_character,
        acousticness:         0.10,
        danceability:         0.10,
        duration_ms:          10,
        energy:               0.10,

        instrumentalness:     0,

        key:                  10,
        liveness:             0.10,
        loudness:             0.10,
        mode:                 10,
        speechiness:          0.10,
        tempo:                0.10,
        time_signature:       10,
        valence:              0.10
    )
    FactoryBot.create(:track_character,
        acousticness:         0.20,
        danceability:         0.20,
        duration_ms:          20,
        energy:               0.20,

        instrumentalness:     0,

        key:                  20,
        liveness:             0.20,
        loudness:             0.20,
        mode:                 20,
        speechiness:          0.20,
        tempo:                0.20,
        time_signature:       20,
        valence:              0.20
    )
    FactoryBot.create(:track_character,
        acousticness:         0.30,
        danceability:         0.30,
        duration_ms:          30,
        energy:               0.30,

        instrumentalness:     0,

        key:                  30,
        liveness:             0.30,
        loudness:             0.30,
        mode:                 30,
        speechiness:          0.30,
        tempo:                0.30,
        time_signature:       30,
        valence:              0.30
    )
    FactoryBot.create(:track_character,
        acousticness:         0.40,
        danceability:         0.40,
        duration_ms:          40,
        energy:               0.40,

        instrumentalness:     0,

        key:                  40,
        liveness:             0.40,
        loudness:             0.40,
        mode:                 40,
        speechiness:          0.40,
        tempo:                0.40,
        time_signature:       40,
        valence:              0.40
    )
    TrackCharacter.last(4)
  end

  def self.create_four_liked_realisitic_songs
    FactoryBot.create(:track_character, acousticness: 0.637, danceability: 0.596, duration_ms: 320680, energy: 0.393, instrumentalness: 0.0, key: 8, liveness: 0.539, loudness: -8.714, mode: 1, speechiness: 0.383, tempo: 107.425, time_signature: 4, valence: 0.36)
    FactoryBot.create(:track_character, acousticness: 0.593, danceability: 0.837, duration_ms: 147240, energy: 0.562, instrumentalness: 0.0, key: 1, liveness: 0.104, loudness: -6.038, mode: 1, speechiness: 0.492, tempo: 100.17, time_signature: 4, valence: 0.149)
    FactoryBot.create(:track_character, acousticness: 0.0284, danceability: 0.7, duration_ms: 235540, energy: 0.615, instrumentalness: 0.0133, key: 8, liveness: 0.0843, loudness: -5.387, mode: 1, speechiness: 0.0619, tempo: 96.84, time_signature: 4, valence: 0.449)
    FactoryBot.create(:track_character, acousticness: 0.0354, danceability: 0.745, duration_ms: 293947, energy: 0.579, instrumentalness: 0.0118, key: 1, liveness: 0.246, loudness: -5.771, mode: 1, speechiness: 0.138, tempo: 97.002, time_signature: 4, valence: 0.645)
    TrackCharacter.last(4)
  end

  def self.create_four_disliked_realistic_songs
    FactoryBot.create(:track_character, acousticness: 0.581, danceability: 0.664, duration_ms: 44827, energy: 0.383, instrumentalness: 0.0, key: 9, liveness: 0.234, loudness: -7.807, mode: 1, speechiness: 0.764, tempo: 159.613, time_signature: 4, valence: 0.963)
    FactoryBot.create(:track_character, acousticness: 0.0192, danceability: 0.832, duration_ms: 191592, energy: 0.797, instrumentalness: 0.0, key: 2, liveness: 0.073, loudness: -4.021, mode: 1, speechiness: 0.124, tempo: 104.044, time_signature: 4, valence: 0.356)
    FactoryBot.create(:track_character, acousticness: 0.112, danceability: 0.657, duration_ms: 224841, energy: 0.752, instrumentalness: 0.0, key: 9, liveness: 0.134, loudness: -3.524, mode: 0, speechiness: 0.0764, tempo: 140.084, time_signature: 4, valence: 0.394)
    FactoryBot.create(:track_character, acousticness: 0.205, danceability: 0.864, duration_ms: 144560, energy: 0.484, instrumentalness: 0.0, key: 6, liveness: 0.248, loudness: -9.159, mode: 0, speechiness: 0.344, tempo: 160.052, time_signature: 4, valence: 0.534)
    TrackCharacter.last(4)
  end

  def self.user_assesses_songs(user, songs, assessment)
    songs.each do |song|
      FactoryBot.create(:user_track_character,
        user: user,
        track_character: song,
        assessment: assessment
      )
    end
  end

end

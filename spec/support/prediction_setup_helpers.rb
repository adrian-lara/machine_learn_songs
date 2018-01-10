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

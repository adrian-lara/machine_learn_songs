require 'rails_helper'

describe Prediction do
  before(:all) do
    DatabaseCleaner.clean
    liked_songs = PredictionSetupHelper.create_four_liked_songs
    disliked_songs = PredictionSetupHelper.create_four_disliked_songs
    user = create(:user)
    PredictionSetupHelper.user_assesses_songs(user, liked_songs, "Like")
    PredictionSetupHelper.user_assesses_songs(user, disliked_songs, "Dislike")

    @prediction = Prediction.new(user)
  end

  describe "Instance Methods" do
    describe "#result" do
      it "returns PredictionResult for a very likable song with like_score of 100.0 and a dislike_score of 0.0" do
        very_likable_song = TrackCharacter.new(
          acousticness:         0.74,
          danceability:         0.74,
          duration_ms:          74,
          energy:               0.74,
          instrumentalness:     0.74,
          key:                  74,
          liveness:             0.74,
          loudness:             0.74,
          mode:                 74,
          speechiness:          0.74,
          tempo:                0.74,
          time_signature:       74,
          valence:              0.74
        )
        result = @prediction.result(very_likable_song)
        expect(result).to be_a PredictionResult
        expect(result.like_score).to eq(100.0)
        expect(result.dislike_score).to eq(0.0)
      end

      it "returns PredictionResult for a very dislikable song with like_score of 0.0 and a dislike_score of 100.0" do
        very_dislikable_song = TrackCharacter.new(
          acousticness:         0.24,
          danceability:         0.24,
          duration_ms:          24,
          energy:               0.24,
          instrumentalness:     0.24,
          key:                  24,
          liveness:             0.24,
          loudness:             0.24,
          mode:                 24,
          speechiness:          0.24,
          tempo:                0.24,
          time_signature:       24,
          valence:              0.24
        )
        result = @prediction.result(very_dislikable_song)
        expect(result).to be_a PredictionResult
        expect(result.like_score).to eq(0.0)
        expect(result.dislike_score).to eq(100.0)
      end
    end
  end
end

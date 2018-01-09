require 'rails_helper'

describe TrackCharacter do
  describe "Class Methods" do
    before(:all) do
      DatabaseCleaner.clean
      @tc_1 = create(:track_character)
      @tc_2 = create(:track_character)
      @tc_3 = create(:track_character)
      user = create(:user)

      create(:user_track_character, user: user, track_character: @tc_1, assessment: 0)
      create(:user_track_character, user: user, track_character: @tc_2, assessment: 0)
      create(:user_track_character, user: user, track_character: @tc_3, assessment: 1)
    end

    describe ".liked" do
      it "returns all the TrackCharacters that've been liked" do
        expect(TrackCharacter.liked.count).to eq(2)
        expect(TrackCharacter.liked).to include(@tc_1)
        expect(TrackCharacter.liked).to include(@tc_2)
      end
    end

    describe ".disliked" do
      it "returns all the TrackCharacters that've been disliked" do
        expect(TrackCharacter.disliked.count).to eq(1)
        expect(TrackCharacter.disliked).to include(@tc_3)
      end
    end

    describe ".calculable_attributes" do
      it "returns a collection of attributes that are calculable (no ids or timestamps)" do
        actual = TrackCharacter.calculable_attributes
        expected = [
          "acousticness",
          "danceability",
          "duration_ms",
          "energy",
          "instrumentalness",
          "key",
          "liveness",
          "loudness",
          "mode",
          "speechiness",
          "tempo",
          "time_signature",
          "valence"
        ]

        expect(actual).to eq(expected)
      end
    end
  end
end

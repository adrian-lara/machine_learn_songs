require 'rails_helper'

describe User do
  describe "Instance Methods" do
    let (:user) { create(:user,
        uid: "user_id_1",
        access_token: "access_token_1",
        refresh_token: "refresh_token_1",
        token_type: "Bearer"
      ) }

    describe "#uid" do
      it "returns the uid of a User" do
        expect(user.uid).to eq("user_id_1")
      end
    end

    describe "#access_token" do
      it "returns the access_token of a User" do
        expect(user.access_token).to eq("access_token_1")
      end
    end

    describe "#refresh_token" do
      it "returns the refresh_token of a User" do
        expect(user.refresh_token).to eq("refresh_token_1")
      end
    end

    describe "#token_type" do
      it "returns the token_type of a User" do
        expect(user.token_type).to eq("Bearer")
      end
    end

    describe "liked and disliked songs methods" do
      before(:all) do
        DatabaseCleaner.clean
        @tc_1 = create(:track_character)
        @tc_2 = create(:track_character)
        @tc_3 = create(:track_character)
        @user = create(:user)

        create(:user_track_character, user: @user, track_character: @tc_1, assessment: 0)
        create(:user_track_character, user: @user, track_character: @tc_2, assessment: 0)
        create(:user_track_character, user: @user, track_character: @tc_3, assessment: 1)
      end

      describe "#liked_songs" do
        it "returns all the TrackCharacters that've been liked by this user" do
          expect(@user.liked_songs.count).to eq(2)
          expect(@user.liked_songs).to include(@tc_1)
          expect(@user.liked_songs).to include(@tc_2)
        end
      end

      describe "#disliked_songs" do
        it "returns all the TrackCharacters that've been disliked by this user" do
          expect(@user.disliked_songs.count).to eq(1)
          expect(@user.disliked_songs).to include(@tc_3)
        end
      end
    end
  end
end

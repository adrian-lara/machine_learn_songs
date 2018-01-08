require 'rails_helper'

describe "As a registered user (that's currently playing a song on Spotify) that's on my dashboard" do
  describe "And I click the 'Like' button for the song currently playing" do
    it "Then that track_id and spotify analytics are saved to TrackCharacters, and the 'Like' is saved to UserTrackCharacters" do
      VCR.use_cassette("user_likes_song") do
        user = create(:user,
          access_token: ENV['access_token'],
          refresh_token: ENV['refresh_token']
        )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        within(".currently-playing") do
          within(".like-dislike") do
            expect(page).to have_link("Like")
            expect(page).to have_link("Dislike")
          end
        end

        track_before_count = TrackCharacter.count
        user_track_before_count = UserTrackCharacter.count

        click_on "Like"

        expect(TrackCharacter.count).to eq(track_before_count + 1)
        expect(UserTrackCharacter.count).to eq(user_track_before_count + 1)

        track_character = TrackCharacter.find_by(track_id: "4PpuH4mxL0rD35mOWaLoKS")
        expect(track_character.user_track_characters.first.assessment).to eq("Like")
      end
    end

    it "Then I see 'Liked' instead of the Like and Dislike links, and I'm still on the dashboard" do
      VCR.use_cassette("user_likes_song") do
        user = create(:user,
          access_token: ENV['access_token'],
          refresh_token: ENV['refresh_token']
        )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'
        click_on "Like"

        within(".currently-playing") do
          within(".like-dislike") do
            expect(page).to have_content("Liked!")
            expect(page).not_to have_link("Like")
            expect(page).not_to have_link("Dislike")
          end
        end

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
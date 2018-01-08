require 'rails_helper'

describe "As a registered user (that's currently playing a song on Spotify) that's on my dashboard" do
  describe "And I click the 'Like' button for the song currently playing which has already been saved to the database" do
    it "Then a new TrackCharacter record is NOT created, but the 'Like' is saved to UserTrackCharacters" do
      VCR.use_cassette("user_likes_song_already_in_database") do
        user = create(:user,
          access_token: ENV['access_token'],
          refresh_token: ENV['refresh_token']
        )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        TrackCharacter.create(track_id: "3eze1OsZ1rqeXkKStNfTmi")

        track_before_count = TrackCharacter.count
        user_track_before_count = UserTrackCharacter.count

        click_on "Like"

        expect(TrackCharacter.count).to eq(track_before_count)
        expect(UserTrackCharacter.count).to eq(user_track_before_count + 1)
        expect(UserTrackCharacter.last.assessment).to eq("Like")
        expect(UserTrackCharacter.last.user_id).not_to be nil
        expect(UserTrackCharacter.last.track_character_id).not_to be nil

        within(".currently-playing") do
          within(".like-dislike") do
            expect(page).to have_content("Liked!")
            expect(page).not_to have_link("Like")
            expect(page).not_to have_link("Dislike")
          end
        end
      end
    end
  end
end

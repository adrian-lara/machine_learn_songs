require "rails_helper"

describe "As a logged in user, when I visit my dashboard" do
  it "then I see my spotify username, and I can see the song I'm currently playing on Spotify" do
    VCR.use_cassette("user_dashboard") do
      user = create(:user,
        uid: "aid",
        access_token: ENV["access_token"],
        refresh_token: ENV["refresh_token"],
        token_type: "Bearer"
      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(user.uid)
      within(".currently-playing") do
        expect(page).to have_css("img[src='https://i.scdn.co/image/70429aaeceb7f8f6c087133382728223e0004b29']")
        within(".artists") do
          expect(page).to have_content("Kendrick Lamar")
        end
        within(".song-title") do
          expect(page).to have_content("LUST.")
        end
        within(".album-title") do
          expect(page).to have_content("DAMN")
        end
      end
    end
  end

  it "then I see a message telling me to play a song if I'm not currently playing a song" do
    VCR.use_cassette("user_dashboard_no_song") do
      user = create(:user,
        uid: "aid",
        access_token: ENV["access_token"],
        refresh_token: ENV["refresh_token"],
        token_type: "Bearer"
      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'
      within(".currently-playing") do
        expect(page).to have_content("Play a song on Spotify!")
      end
      within(".nav-bar") do
        expect(page).to have_link("Dashboard")
        expect(page).to have_link("Log Out")
      end
    end
  end
end

require "rails_helper"

describe "As a logged in user, when I visit my learn" do
  it "then I see my spotify username, and I can see the song I'm currently playing on Spotify" do
    VCR.use_cassette("user_visits_learn_playing_song_juke_jam") do
      user = create(:user,
        uid: "aid",
        access_token: ENV["access_token"],
        refresh_token: ENV["refresh_token"],
        token_type: "Bearer"
      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/learn'

      expect(current_path).to eq(learn_path)
      expect(page).to have_content(user.uid)
      within(".currently-playing") do
        expect(page).to have_css("img[src='https://i.scdn.co/image/4df3b334d17428ba101ac867e6f97a0196af1635']")
        within(".artists") do
          expect(page).to have_content("Chance The Rapper, Justin Bieber, Towkio")
        end
        within(".song-title") do
          expect(page).to have_content("Juke Jam")
        end
        within(".album-title") do
          expect(page).to have_content("Coloring Book")
        end
      end
    end
  end

  it "then I see a message telling me to play a song if I'm not currently playing a song" do
    VCR.use_cassette("user_learn_no_song") do
      user = create(:user,
        uid: "aid",
        access_token: ENV["access_token"],
        refresh_token: ENV["refresh_token"],
        token_type: "Bearer"
      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/learn'
      within(".currently-playing") do
        expect(page).to have_content("Play a song on Spotify!")
      end
      within(".nav-bar") do
        expect(page).to have_link("Learn")
        expect(page).to have_link("Log Out")
      end
    end
  end
end

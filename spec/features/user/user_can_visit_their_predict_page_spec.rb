require 'rails_helper'

describe "As a registered user (playing a song on Spotify and having liked and disliked some songs)" do
  describe "when I visit the '/predict' page" do
    it "Then I see the currently playing song and result of the rating" do
      VCR.use_cassette("user_visits_predict_page") do
        Capybara.asset_host = "http://localhost:3000/"
        DatabaseCleaner.clean
        liked_songs = PredictionSetupHelper.create_four_liked_realisitic_songs
        disliked_songs = PredictionSetupHelper.create_four_disliked_realistic_songs
        user = create(:user, uid: "aid", access_token: ENV["access_token"], refresh_token: ENV["refresh_token"], token_type: "Bearer")
        PredictionSetupHelper.user_assesses_songs(user, liked_songs, "Like")
        PredictionSetupHelper.user_assesses_songs(user, disliked_songs, "Dislike")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit '/predict'


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

          within(".prediction-result") do
            expect(page).to have_content("% you'll like it!")
            expect(page).to have_content("% you'll dislike it!")
          end
        end
      end
    end
  end
end

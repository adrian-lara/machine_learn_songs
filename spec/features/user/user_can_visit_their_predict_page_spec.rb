require 'rails_helper'

describe "As a registered user" do
  context "having liked and disliked some songs" do
    context "when I visit the '/predict' page with a song playing" do
      it "Then I see the currently playing song and result of the rating" do
        VCR.use_cassette("user_visits_predict_page") do
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

    context "when I visit the '/predict' page without a song playing" do
      it "Then I see 'Play a song on Spotify!'" do
        VCR.use_cassette('predict_page_no_currently_playing') do
          liked_songs = PredictionSetupHelper.create_four_liked_realisitic_songs
          disliked_songs = PredictionSetupHelper.create_four_disliked_realistic_songs
          user = create(:user, uid: "aid", access_token: ENV["access_token"], refresh_token: ENV["refresh_token"], token_type: "Bearer")
          PredictionSetupHelper.user_assesses_songs(user, liked_songs, "Like")
          PredictionSetupHelper.user_assesses_songs(user, disliked_songs, "Dislike")

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit '/predict'

          within(".currently-playing") do
            expect(page).to have_content("Play a song on Spotify!")
          end
        end
      end
    end
  end

  context "having NOT liked or disliked any songs" do
    context "when I visit the '/predict' page with a song playing" do
      it "I'll see a 'Like and/or dislike some songs!' message" do
        VCR.use_cassette('predict_page_no_likes_dislikes') do
          DatabaseCleaner.clean
          user = create(:user, uid: "aid", access_token: ENV["access_token"], refresh_token: ENV["refresh_token"], token_type: "Bearer")

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit '/predict'

          within(".prediction-result") do
            expect(page).not_to have_content("%")
            expect(page).to have_content("Like and/or dislike some songs!")
          end
        end
      end
    end
  end
end

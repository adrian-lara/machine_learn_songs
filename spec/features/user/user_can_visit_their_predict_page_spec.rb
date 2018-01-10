require 'rails_helper'

describe "As a registered user, when I visit my dashboard and click 'Predict'" do
  it "I'm now on the '/predict' page and I see the song I'm currently playing" do
    VCR.use_cassette("user_visits_predict_page") do
      user = create(:user,
        uid: "aid",
        access_token: ENV["access_token"],
        refresh_token: ENV["refresh_token"],
        token_type: "Bearer"
      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'
      click_link "Predict"

      expect(current_path).to eq('/predict')
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
        expect(page).to have_link("Predict")
      end
    end
  end
end

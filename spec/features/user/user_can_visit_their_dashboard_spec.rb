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
      expect(page).to have_content("Kendrick Lamar")
      expect(page).to have_content("LUST.")
    end
  end
end

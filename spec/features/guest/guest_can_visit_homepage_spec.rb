require 'rails_helper'

describe "As a guest, when I visit '/'" do
  it "then I see 'Log In', 'How It Works', and 'SiteName' links" do
    visit '/'

    expect(page).to have_link("Log In")
    within(".nav-bar") do
      expect(page).to have_link("MachineLearnSongs")
    end
  end
end

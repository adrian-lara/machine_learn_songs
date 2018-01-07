require 'rails_helper'

describe "As a registered user, when I visit the root" do
  it "I don't see the 'Log In' link" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).not_to have_link("Log In")
  end
end

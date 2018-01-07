require 'rails_helper'

describe "As a guest, when I visit '/dashboard'" do
  it "I get a 404 error" do
    expect{ visit '/dashboard' }.to raise_error(ActionController::RoutingError)
  end
end

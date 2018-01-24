require 'rails_helper'

describe "As a guest, when I visit '/learn'" do
  it "I get a 404 error" do
    expect{ visit '/learn' }.to raise_error(ActionController::RoutingError)
  end
end

require 'rails_helper'

describe Prediction do
  before(:all) do
    DatabaseCleaner.clean
    liked_songs = PredictionSetupHelper.create_four_liked_songs
    disliked_songs = PredictionSetupHelper.create_four_disliked_songs
    user = create(:user)
    PredictionSetupHelper.user_assesses_songs(user, liked_songs, "Like")
    PredictionSetupHelper.user_assesses_songs(user, disliked_songs, "Dislike")

    @prediction = Prediction.new(user)
  end

  describe "Instance Methods" do
    describe "#" do
      it "returns" do
binding.pry
      end
    end
  end
end

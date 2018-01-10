require 'rails_helper'

describe PredictionResult do

  before(:all) do
    @result = PredictionResult.new(0.75,0.25)
  end

  describe "Instance Methods" do
    describe "#like_score" do
      it "returns the like score or percentage" do
        expect(@result.like_score).to eq(75.0)
      end
    end

    describe "#dislike_score" do
      it "returns the like score or percentage" do
        expect(@result.dislike_score).to eq(25.0)
      end
    end
  end
end

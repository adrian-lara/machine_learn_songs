require 'rails_helper'

describe User do
  describe "Instance Methods" do
    let (:user) { create(:user,
        uid: "user_id_1",
        access_token: "access_token_1",
        refresh_token: "refresh_token_1",
        token_type: "Bearer"
      ) }

    describe "#uid" do
      it "returns the uid of a User" do
        expect(user.uid).to eq("user_id_1")
      end
    end

    describe "#access_token" do
      it "returns the access_token of a User" do
        expect(user.access_token).to eq("access_token_1")
      end
    end

    describe "#refresh_token" do
      it "returns the refresh_token of a User" do
        expect(user.refresh_token).to eq("refresh_token_1")
      end
    end

    describe "#token_type" do
      it "returns the token_type of a User" do
        expect(user.token_type).to eq("Bearer")
      end
    end
  end
end

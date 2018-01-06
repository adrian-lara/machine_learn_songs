require 'rails_helper'

describe Song do
  describe "Instance Methods" do

    before(:each) do
      @song = Song.new({ item:
        { name: "FEEL.",
          artists: [{
            name: "Kendrick Lamar"
            }],
          album: {
            name: "DAMN",
            images: [{ url: "https://i.scdn.co/image/70429aaeceb7f8f6c087133382728223e0004b29" }]
          },
        }
      })
    end

    describe "#title" do
      it "returns the title of the song" do
        expect(@song.title).to eq("FEEL.")
      end
    end

    describe "#artists" do
      it "returns the artists of the song" do
        expect(@song.artists).to eq("Kendrick Lamar")
      end
    end

    describe "#album" do
      it "returns the album of the song" do
        expect(@song.album).to eq("DAMN")
      end
    end

    describe "#album_cover" do
      it "returns the album cover of the song" do
        expect(@song.album_cover).to eq("https://i.scdn.co/image/70429aaeceb7f8f6c087133382728223e0004b29")
      end
    end
  end
end

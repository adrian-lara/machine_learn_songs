class SpotifyService

  def initialize(user)
    @conn = Faraday.new("https://api.spotify.com")
    @user = user
  end

  def currently_playing
    response = conn.get do |req|
      req.url "/v1/me/player/currently-playing"
      req.headers['Authorization'] = "Bearer #{user.access_token}"
    end

    create_song(response) unless response.body.empty?
  end

  def get_audio_features(track_id)
    response = conn.get do |req|
      req.url "v1/audio-features/#{track_id}"
      req.headers['Authorization'] = "#{user.token_type} #{user.access_token}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

    attr_reader :conn, :user

    def create_song(response)
      raw_song_data = JSON.parse(response.body, symbolize_names: true)
      @song = Song.new(raw_song_data, user)
    end
end

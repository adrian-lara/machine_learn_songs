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

    unless response.body.empty?
      JSON.parse(response.body, symbolize_names: true)
    end
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

end

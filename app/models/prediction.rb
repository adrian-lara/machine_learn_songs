class Prediction

  def initialize(user)
    @user = user
    @songs = user.track_characters
  end

  def result
    binding.pry
  end

  private

    attr_reader :user, :songs

    def liked_songs
      @liked_songs ||= user.liked_songs
    end

    def disliked_songs
      @disliked_songs ||= user.disliked_songs
    end

    def probability_like
      @probability_like ||= (liked_songs.count.to_f / songs.count)
    end

    def probability_dislike
      @probability_dislike ||= (disliked_songs.count.to_f / songs.count)
    end

    def liked_probability_params
      @liked_probability_params ||= TrackCharacter.calculable_attributes
        .reduce({}) do |params, attrib|
          params[attrib.to_sym] = attr_params(attrib, liked_songs)
          params
        end
    end

    def disliked_probability_params
      @disliked_probability_params ||= TrackCharacter.calculable_attributes
        .reduce({}) do |params, attrib|
          params[attrib.to_sym] = attr_params(attrib, disliked_songs)
          params
        end
    end

    def attr_params(attrib, songs)
      {
        mean: calculate_mean(attrib, songs),
        variance: calculate_variance(attrib, songs)
      }
    end

    def calculate_mean(attrib, songs)
      songs.average(attrib.to_sym)
    end

    def calculate_variance(attrib, songs)
      attrib_values = songs.pluck(attrib.to_sym)
      mean = calculate_mean(attrib, songs)

      sq_differences = attrib_values.map { |v| (v - mean) ** 2 }
      sq_differences.reduce(:+) / sq_differences.count
    end
end

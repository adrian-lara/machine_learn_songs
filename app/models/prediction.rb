class Prediction

  def initialize(user)
    @user = user
  end

  def result(input_song)
    prb_like = prb_like_given_song(input_song)
    prb_dislike = prb_dislike_given_song(input_song)
    PredictionResult.new(prb_like, prb_dislike)
  end

  private

    attr_reader :user

    def bayes_attributes
      @bayes_attributes ||= TrackCharacter.calculable_attributes
    end

    def users_songs
      @users_songs ||= user.track_characters
    end

    def liked_songs
      @liked_songs ||= user.liked_songs
    end

    def disliked_songs
      @disliked_songs ||= user.disliked_songs
    end

    def like_frequency
      @like_frequency ||= (liked_songs.count.to_f / users_songs.count)
    end

    def dislike_frequency
      @dislike_frequency ||= (disliked_songs.count.to_f / users_songs.count)
    end

    def liked_pdf_params
      @liked_pdf_params ||= pdf_params(liked_songs)
    end

    def disliked_pdf_params
      @disliked_pdf_params ||= pdf_params(disliked_songs)
    end

    def pdf_params(songs)
      bayes_attributes
        .reduce({}) do |params, attrib|
          params[attrib.to_sym] = attr_params(attrib, songs)
          params
        end
    end

    def attr_params(attrib, songs)
      {
        mean: mean(attrib, songs),
        variance: variance(attrib, songs)
      }
    end

    def mean(attrib, songs)
      songs.average(attrib.to_sym)
    end

    def variance(attrib, songs)
      attrib_values = songs.pluck(attrib.to_sym)
      mean = mean(attrib, songs)

      sq_differences = attrib_values.map { |v| (v - mean) ** 2 }
      sq_differences.reduce(:+) / sq_differences.count
    end

    def normal_pdf(x, attr_params)
      return 1 if attr_params[:variance] == 0

      two_pi_variance = 2.0 * Math::PI * attr_params[:variance]
      sq_difference = (x - attr_params[:mean]) ** 2
      e_exponent = -0.5 * (sq_difference / attr_params[:variance])

      (1.0 / Math.sqrt(two_pi_variance)) * (Math::E ** e_exponent)
    end

    def prb_song_given_like(song)
      bayes_attributes.reduce(1) do |total, attrib|
        total *= normal_pdf(song.send(attrib), liked_pdf_params[attrib.to_sym])
        total
      end
    end

    def prb_song_given_dislike(song)
      bayes_attributes.reduce(1) do |total, attrib|
        total *= normal_pdf(song.send(attrib), disliked_pdf_params[attrib.to_sym])
        total
      end
    end

    def prb_like_given_song(song)
      (prb_song_given_like(song) * like_frequency) / (
        (prb_song_given_like(song) * like_frequency) +
        (prb_song_given_dislike(song) * dislike_frequency)
      )
    end

    def prb_dislike_given_song(song)
      (prb_song_given_dislike(song) * dislike_frequency) / (
        (prb_song_given_like(song) * like_frequency) +
        (prb_song_given_dislike(song) * dislike_frequency)
      )
    end
end

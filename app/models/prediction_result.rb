class PredictionResult

  attr_reader :like_score, :dislike_score

  def initialize(prb_like, prb_dislike)
    @like_score = format_score(prb_like)
    @dislike_score = format_score(prb_dislike)
  end

  private

    def format_score(num)
      (num * 100).to_f.round(1)
    end

end

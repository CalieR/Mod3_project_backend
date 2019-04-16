class Round < ApplicationRecord
  has_many :answers

  def create
    @round = Round.create(round_params)
  end

  def score
    score = 0
    self.answered_question.each do
      score += 1
    end
    score
  end

  def self.leaderboard
    Round.all.sort()[0..10]
  end

  def correct
    self.answer == self.question.correct_answer
  end


  private
  def round_params
    params.require(:round).permit(:playername)
  end


end
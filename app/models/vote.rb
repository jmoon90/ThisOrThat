class Vote < ActiveRecord::Base
  belongs_to :option,
  inverse_of: :votes,
  dependent: :destroy

  def self.total_for(vote)
    vote.option.votes.count
  end

  def self.total_against(vote)
    vote_count = vote.option_id
    against_vote = vote.option.question.options.where("id != #{vote_count}").first
    against_vote.votes.count
  end
end

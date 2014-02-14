class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      flash[:notice] = "#{ Vote.total_for(@vote) } agree and
#{ Vote.total_against(@vote) } disagree"
      redirect_to root_path
    end
  end

  private
  def vote_params
    params.permit(:option_id)
  end
end

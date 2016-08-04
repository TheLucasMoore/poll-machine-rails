class VotesController < ApplicationController
  def create
    question_id = params["question"]
    @question = Question.find(question_id)
    @vote = Vote.create(question: @question, user: current_user)
  end

  private

  def vote_params
    params.require(:votes).permit(:question)
  end
end

class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question])
    @poll = Poll.find(params[:poll])
    @vote = Vote.new(question: @question, poll: @poll, user: current_or_guest_user)
    if @vote.save
      message = "You have a new vote"
      notification = Notification.create(user_id: @poll.user.id, message: message)
      flash[:alert] = "Thanks for your vote."
      redirect_to poll_charts_path(@poll)
    else
      flash[:error] = @vote.errors.full_messages[0]
      redirect_to poll_path(@poll)
    end
  end

  private

  def vote_params
    params.require(:votes).permit(:question, :poll)
  end
end

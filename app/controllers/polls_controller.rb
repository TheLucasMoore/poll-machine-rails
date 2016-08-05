class PollsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @user = current_or_guest_user
    @polls = Poll.where(user_id: current_user.id)
  end

  def show
    @poll = Poll.find(params[:id])
    @user = current_or_guest_user
    if @poll.end_time > Date.today
      redirect_to poll_charts_path(@poll)
      flash[:alert] = "This poll has closed. Check out the results!"
    end
  end

  def chart
    @poll = Poll.find(params[:id])
    @questions = @poll.questions
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      redirect_to new_poll_question_path(@poll)
    else
      render :new
    end
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.update(poll_params)
    redirect_to poll_path(@poll)
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :end_time)
  end
end

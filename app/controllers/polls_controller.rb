class PollsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @polls = Poll.where(user_id: current_user.id)
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.update(poll_params)
    redirect_to poll_path(@poll)
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      redirect_to poll_path(@poll)
    else
      render :new
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title)
  end
end

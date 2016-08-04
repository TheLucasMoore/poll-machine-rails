class ChartsController < ApplicationController
  def index
    @poll = Poll.find(params[:poll_id])
    @questions = @poll.questions
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @questions}
    end
  end
end

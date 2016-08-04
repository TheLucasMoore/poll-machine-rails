class QuestionsController < ApplicationController
  before_action :find_poll

  def index
    @questions = @poll.questions
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @questions}
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    params.each do |param, value|
      if param.include?("question")
        q = Question.create(content: value)
        q.poll = @poll
        q.save
        #raise q.inspect
      end
    end
    redirect_to poll_path(@poll)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  private

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end
end

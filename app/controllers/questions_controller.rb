class QuestionsController < ApplicationController
  before_action :find_poll

  def index
    @questions = @poll.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.poll = @poll
    if @question.save
      redirect_to poll_question_path(@poll, @question)
    else
      render :new
    end
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

  def question_params
    params.require(:question).permit(:content, :poll_id)
  end

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end
end

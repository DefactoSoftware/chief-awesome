class QuestionsController < ApplicationController
  before_action :authorize

  def index
    @questions = Question.all
  end

  def show
    resource
    @answer = resource.answers.build
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.user = current_user
    question.save!
    redirect_to question_path(question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

  def resource
    @question ||= Question.find(params[:id])
  end
end

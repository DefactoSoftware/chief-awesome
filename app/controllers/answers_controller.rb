class AnswersController < ApplicationController
  def create
    answer = Answer.new(answer_params)
    answer.user = current_user
    answer.question = Question.find(params[:question_id])
    if answer.save
      redirect_to question_path(answer.question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end

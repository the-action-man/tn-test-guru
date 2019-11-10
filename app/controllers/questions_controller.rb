class QuestionsController < ApplicationController

  def index
    render json: Question.where(test_id: params[:test_id])
  end

  def show
    render json: Question.where(id: params[:id])
  end

  def new; end

  def create
    q = Question.create!(question_params)
    render plain: "'#{params[:question][:body]}' question is created for test"\
                  " '#{Test.select(:title).where(id: params[:test_id]).pluck(:title)[0]}' \n\n #{q.inspect}"
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end

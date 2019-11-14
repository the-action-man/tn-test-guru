class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show; end

  def new; end

  def create
    question = Question.new
    question.body = params.require(:question).permit(:body)[:body]
    question.test = @test
    question.save!
    render plain: "'#{question.body}' question is created for test '#{@test.title}'" \
                  "\n\nQuestion inspect: #{question.inspect}"
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

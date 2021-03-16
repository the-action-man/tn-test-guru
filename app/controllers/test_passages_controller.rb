class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.update!(success: true) if @test_passage.passed?
      BadgeService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(current_user, @test_passage.current_question).call
    flash_options = if result.respond_to? :html_url
                      { notice: t('.success_url', link: result.html_url) }
                    elsif result.success?
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

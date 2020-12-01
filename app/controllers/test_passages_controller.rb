class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, octokit_client).call
    flash_options = if result.respond_to? :url
                      { notice: t('.success_url', link: result.url) }
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

  def octokit_client
    Octokit::Client.new(:access_token => '5e968f34ce70b9c9fc08d0b4d1f2d556962417d3')
    # TODO: add to ENV and use
    # ENV['GITHUB_TOKEN']
  end
end

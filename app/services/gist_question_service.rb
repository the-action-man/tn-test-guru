class GistQuestionService
  def initialize(user, question, use_octokit_client = true)
    @user = user
    @question = question
    @test = @question.test
    @client = use_octokit_client ? octokit_client : GitHubClient.new
  end

  def call
    result = @client.create_gist(gist_params)
    save_new_gist(@question, result.html_url) if result.respond_to? :html_url
    result
  end

  private

  def gist_params
    {
      description: I18n.t('test_passages.gist.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def octokit_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def save_new_gist(question, url)
    Gist.new(url: url, user_id: @user.id, question_id: question.id).save
  end
end

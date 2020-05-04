class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze


  # TODO: remove
  ACCESS_TOKEN = "4b63726404ed314f93f461907c5b34fb4d16f352".freeze
  # TODO: add
  # ACCESS_TOKEN = ENV['GITHUB_TOKEN']


  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end


end

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze


  # TODO: remove
  ACCESS_TOKEN = "5e968f34ce70b9c9fc08d0b4d1f2d556962417d3".freeze
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

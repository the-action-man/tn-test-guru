module ApplicationHelper
  FLASH_MESSAGES_KEYS = %i[success notice alert].freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end

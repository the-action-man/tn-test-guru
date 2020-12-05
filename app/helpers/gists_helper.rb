module GistsHelper
  def url_hash(url)
    url.split("/").last
  end

  def question_view(text)
    text.truncate(25)
  end
end

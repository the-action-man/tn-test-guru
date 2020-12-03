module GistsHelper
  def url_hash(url)
    url.split("/").last
  end

  def question_view(text)
    text[0..25]
  end
end
